import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'openid.dart';

class AuthState extends ChangeNotifier {
  final _konfachSsoURI = Uri.parse('https://sso.konfach.ru/realms/konfach');
  static const _ssoClient = 'konfa';

  Credential? _credential;

  Credential? get credential => _credential;

  Future<void> authenticate() async {
    final issuer = await Issuer.discover(_konfachSsoURI);
    final konfachSSOClient = Client(
      issuer,
      _ssoClient,
      clientSecret: "UqeaMowRXcGULkAepr0EAEUfE82OjY72",
    );
    _credential = await authenticateOIDC(
      konfachSSOClient,
      scopes: ['openid', 'profile', 'email'],
    );
    notifyListeners();
  }

  void logout() {
    _credential = null;
    notifyListeners();
  }
}
