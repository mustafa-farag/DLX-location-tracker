import 'package:dlx/controllers/auth_cubit/cubit.dart';
import 'package:dlx/controllers/home_cubit/cubit.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/screens/auth_screen.dart';
import '../view/screens/landing_screen.dart';

Route<dynamic> onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
              child: const HomeScreen()), settings: settings);
    case AppRoutes.authScreenRoute:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => AuthCubit(),
                child: const AuthScreen(),
              ),
          settings: settings);
    case AppRoutes.landingScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
  }
}
