import 'package:dlx/controllers/database_controller.dart';
import 'package:dlx/model/user_data.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/utilities/constant.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;

  final _database = FirestoreDatabase();

  AuthController({required this.auth});

  Future signInAnon() async {
    try {
      await auth.signInAnon();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setUserData({
    required String name,
    required String phone,
    required String age,
  }) async {
    try {
      await _database.setUserData(UserData(
        phone: phone,
        age: age,
        uid: documentIdFromLocalData(),
        name: name,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
