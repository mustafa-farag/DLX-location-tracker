import 'package:dlx/utilities/router.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/utilities/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      initialRoute: AppRoutes.authScreenRoute,
      onGenerateRoute: onGenerateRouter,
    );
  }
}



