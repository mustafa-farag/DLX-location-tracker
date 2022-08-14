import 'package:dlx/controllers/auth_controller.dart';
import 'package:dlx/controllers/home_controller.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:dlx/view/screens/auth_screen.dart';
import 'package:dlx/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                create: (_) => AuthController(auth: auth),
                child: const AuthScreen(),
              );
            }
            return ChangeNotifierProvider<HomeController>(
              create: (_) => HomeController(auth: auth),
              child: const HomeScreen(),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            ),
          );
        });
  }
}
