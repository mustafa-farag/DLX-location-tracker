import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
  Future<User?> signInAnon();
}

class Auth implements AuthBase{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnon() async{

  User? userAuth = (await _auth.signInAnonymously()).user;
  return userAuth;
  }

}