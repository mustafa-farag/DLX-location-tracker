import 'package:dlx/controllers/home_controller.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/view/screens/profile_screen.dart';
import 'package:dlx/view/screens/shipment_screen.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
   AuthBase auth;

   HomeController({required this.auth});

  int currentIndex = 0;
  List<Widget> screens = const [
    ShipmentScreen(),
    ProfileScreen()
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void logout() {
    auth.logout();
  }
}
