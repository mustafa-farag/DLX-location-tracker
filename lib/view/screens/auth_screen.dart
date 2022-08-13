import 'package:dlx/controllers/auth_cubit/cubit.dart';
import 'package:dlx/controllers/auth_cubit/states.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state){},
      builder: (context,state){
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
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: mainColor),
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
                  DefaultButton(onPressed:(){
                    AuthCubit.get(context).signInAnon().then((value) {
                      Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
                    });
                  }, text: 'Anonymous Sign-in'),
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
