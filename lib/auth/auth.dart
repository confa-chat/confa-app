import 'package:collection/collection.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/auth_provider.pb.dart';
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

  AuthState._(this.hub, this.providerName, this._credential);

  static Future<AuthState?> tryLoadSavedAuth(Uri hub, List<AuthProvider> providers) async {
    final prefs = await SharedPreferences.getInstance();
    final savedAuthJson = prefs.getString(_hubAuthKey(hub));

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

    return AuthState._(hub, savedHubAuth.providerName, savedHubAuth.credential);
  }

  Future<void> _saveAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = _SavedAuth(providerName: providerName, credential: _credential);
    await prefs.setString(_hubAuthKey(hub), jsonEncode(saved.toJson()));
  }

  Future<void> _clearSavedAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_hubAuthKey(hub));
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

      final auth = AuthState._(hub, authProvider.name, creds);
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

  void logout() async {
    await _clearSavedAuth();
  }

  Future<TokenResponse> getToken() async {
    if (_credential == null) {
      throw Exception('User is not authenticated');
    }

    try {
      // This will automatically use refresh token if the access token is expired
      final tokenResponse = await _credential!.getTokenResponse();

      // If the token was refreshed, save the updated token
      await _saveAuth();

      return tokenResponse;
    } catch (e) {
      // If refreshing fails, log the user out
      print('Error refreshing token: $e');
      logout();
      throw Exception('Authentication expired. Please log in again.');
    }
  }
}
