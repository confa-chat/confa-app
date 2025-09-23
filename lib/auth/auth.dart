import 'dart:async';

import 'package:collection/collection.dart';
import 'package:confa/gen/proto/confa/node/v1/auth_provider.pb.dart';
import 'package:l/l.dart';
import 'package:openid_client/openid_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'openid.dart';

class OpenIdSettings {
  final String issuer;
  final String clientId;
  final String clientSecret;

  OpenIdSettings({required this.issuer, required this.clientId, required this.clientSecret});
}

String _hubAuthKey(Uri hub) => 'auth_${base64Encode(utf8.encode(hub.toString()))}';

class _SavedAuth {
  String providerName;
  Credential credential;

  _SavedAuth({required this.providerName, required this.credential});

  Map<String, dynamic> toJson() {
    return {'providerName': providerName, 'credential': credential.toJson()};
  }

  factory _SavedAuth.fromJson(Map<String, dynamic> json) {
    return _SavedAuth(
      providerName: json['providerName'] as String,
      credential: Credential.fromJson(json['credential'] as Map<String, dynamic>),
    );
  }
}

class AuthState {
  final Uri hub;
  final String providerName;
  final Credential _credential;
  final StreamSubscription<TokenResponse> _updateController;

  AuthState._(this.hub, this.providerName, this._credential, this._updateController);

  static Future<AuthState?> tryLoadSavedAuth(Uri hub, List<AuthProvider> providers) async {
    final savedAuthJson = await SharedPreferencesAsync().getString(_hubAuthKey(hub));

    if (savedAuthJson == null) {
      return null;
    }

    final savedHubAuth = _SavedAuth.fromJson(jsonDecode(savedAuthJson));
    final issuer = providers.firstWhereOrNull(
      (element) => element.name == savedHubAuth.providerName,
    );

    if (issuer == null) {
      return null;
    }

    await savedHubAuth.credential.getTokenResponse(true);

    await for (final exception in savedHubAuth.credential.validateToken()) {
      l.w('Saved credential is invalid: $exception');
      return null;
    }

    final updateController = savedHubAuth.credential.onTokenChanged.listen((_) async {
      await _staticSaveAuth(hub, savedHubAuth.providerName, savedHubAuth.credential);
    });

    final authState = AuthState._(
      hub,
      savedHubAuth.providerName,
      savedHubAuth.credential,
      updateController,
    );
    await authState._saveAuth();
    return authState;
  }

  static Future<void> removeSavedAuth(Uri hub) async {
    await SharedPreferencesAsync().remove(_hubAuthKey(hub));
  }

  Future<void> _saveAuth() async {
    await _staticSaveAuth(hub, providerName, _credential);
  }

  static Future<void> _staticSaveAuth(Uri hub, String providerName, Credential credential) async {
    final saved = _SavedAuth(providerName: providerName, credential: credential);
    await SharedPreferencesAsync().setString(_hubAuthKey(hub), jsonEncode(saved.toJson()));
  }

  Future<void> _clearSavedAuth() async {
    await SharedPreferencesAsync().remove(_hubAuthKey(hub));
  }

  static Future<AuthState> authenticate(Uri hub, AuthProvider authProvider) async {
    // Use the provided OpenID Connect settings if available
    if (authProvider.hasOpenidConnect()) {
      final creds = await _authenticateWithOpenId(
        OpenIdSettings(
          issuer: authProvider.openidConnect.issuer,
          clientId: authProvider.openidConnect.clientId,
          clientSecret: authProvider.openidConnect.clientSecret,
        ),
      );

      final updateController = creds.onTokenChanged.listen((_) async {
        await _staticSaveAuth(hub, authProvider.name, creds);
      });

      final auth = AuthState._(hub, authProvider.name, creds, updateController);
      await auth._saveAuth();
      return auth;
    }

    throw Exception('Unsupported authentication provider: ${authProvider.name}');
  }

  // Authenticate using provided OpenID Connect settings
  static Future<Credential> _authenticateWithOpenId(OpenIdSettings settings) async {
    final issuer = await Issuer.discover(Uri.parse(settings.issuer));
    final client = Client(issuer, settings.clientId, clientSecret: settings.clientSecret);

    // Use provided scope or default to standard OpenID scopes
    const scopes = [
      'openid',
      'profile',
      'email',
      'offline_access',
    ]; // Added offline_access for refresh tokens

    return await authenticateOIDC(client, scopes: scopes);
  }

  Future<void> logout() async {
    await _updateController.cancel();
    await _clearSavedAuth();
  }

  Future<TokenResponse> getToken() async {
    try {
      // This will automatically use refresh token if the access token is expired
      final tokenResponse = await _credential.getTokenResponse();

      // If the token was refreshed, save the updated token
      await _saveAuth();

      return tokenResponse;
    } catch (e) {
      // If refreshing fails, log the user out
      l.e('Error getting token: $e');
      await logout();
      throw Exception('Authentication expired. Please log in again.');
    }
  }
}
