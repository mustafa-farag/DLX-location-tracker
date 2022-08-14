import 'package:dlx/services/auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;

  AuthController({required this.auth});

  Future signInAnon() async {
    try {
      await auth.signInAnon();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
