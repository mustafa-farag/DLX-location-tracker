import 'package:dlx/controllers/auth_controller.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utilities/colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 20,
                top: 60,
              ),
              child: Column(
                children: [
                  Text(
                    'DXL',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: mainColor,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Location Tracker',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/auth.gif',
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  DefaultButton(
                    onPressed: () {
                      model.signInAnon();
                    },
                    text: 'Anonymous Sign-in',
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
