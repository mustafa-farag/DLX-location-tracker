import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthBase{
  Future<User?> signInAnon();
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<void> logout();
}

class Auth implements AuthBase{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnon() async{

  User? userAuth = (await _auth.signInAnonymously()).user;
  return userAuth;
  }

  @override
  User? get currentUser {
    final user = _auth.currentUser;
    debugPrint(user?.uid.toString());
    return user;
  }

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<void> logout()async => await _auth.signOut();

  }

