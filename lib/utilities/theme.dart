import 'package:dlx/utilities/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme(context) => ThemeData(
      primaryColor: mainColor,
      scaffoldBackgroundColor: backGroundColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: Theme.of(context).textTheme.headline6),
    );
