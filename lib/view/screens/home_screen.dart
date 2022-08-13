import 'package:dlx/controllers/home_cubit/cubit.dart';
import 'package:dlx/controllers/home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        final cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap:(index) {
              cubit.changeNavBar(index);
            },
            items:const [
              BottomNavigationBarItem(
                icon:Icon( Icons.local_shipping),
                label: 'Shipment',
              ),
              BottomNavigationBarItem(
                icon:Icon( Icons.person),
                label: 'Personal Data',
              ),

            ],
          ),
        ) ;
      },
    );
  }
}
