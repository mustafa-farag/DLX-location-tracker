import 'package:dlx/model/user_data.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/view/screens/home_screen.dart';
import 'package:dlx/view/screens/start_shipment_screen.dart';
import 'package:flutter/material.dart';
import '../view/screens/auth_screen.dart';
import '../view/screens/landing_screen.dart';

Route<dynamic> onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.shipmentScreenRoute:
      final userId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) =>  StartShipmentScreen(userId: userId,),
          settings: settings);
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings);
    case AppRoutes.authScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings);
    case AppRoutes.landingScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
          settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
  }
}
