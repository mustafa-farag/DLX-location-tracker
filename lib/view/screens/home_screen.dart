import 'package:dlx/controllers/home_controller.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, model, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "DLX",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: mainColor),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    model.logout();
                  },
                  icon: const Icon(Icons.logout_outlined),)
            ],
          ),
          body: model.screens[model.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (index) {
              model.changeNavBar(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping),
                label: 'Shipment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Personal Data',
              ),
            ],
          ),
        );
      },
    );
  }
}
