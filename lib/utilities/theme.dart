import 'package:dlx/utilities/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme(context) => ThemeData(
      primaryColor: mainColor,
      scaffoldBackgroundColor: backGroundColor,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: mainColor),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: mainColor,
      ),
      appBarTheme: AppBarTheme(
          titleSpacing: 20,
          elevation: 0,
          color: Colors.white,
          iconTheme: const IconThemeData(
            color: mainColor,
          ),
          titleTextStyle: Theme.of(context).textTheme.headline6),
    );
