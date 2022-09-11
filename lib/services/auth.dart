import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  Future<User?> signInAnon();
  Stream<User?> authStateChanges();
  Future<void> logout();
}

class Auth implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnon() async {
    User? userAuth = (await _auth.signInAnonymously()).user;
    return userAuth;
  }

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<void> logout() async => await _auth.signOut();
}
