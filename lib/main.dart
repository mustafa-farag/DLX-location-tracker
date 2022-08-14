import 'package:dlx/services/auth.dart';
import 'package:dlx/utilities/router.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/utilities/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(context),
        initialRoute: AppRoutes.landingScreenRoute,
        onGenerateRoute: onGenerateRouter,
      ),
    );
  }
}



