import 'package:dlx/controllers/home_cubit/states.dart';
import 'package:dlx/view/screens/profile_screen.dart';
import 'package:dlx/view/screens/shipment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = const [
    ShipmentScreen(),
    ProfileScreen()
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarBody());
  }
}