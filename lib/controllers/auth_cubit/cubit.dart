import 'package:dlx/controllers/auth_cubit/states.dart';
import 'package:dlx/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthBase? _auth;

  Future signInAnon() async {
    try {
      final user =await _auth?.signInAnon();
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInErrorState());
      debugPrint(e.toString());
    }
  }
}
