import 'package:dlx/controllers/database_controller.dart';
import 'package:dlx/model/shipment.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:dlx/utilities/constant.dart';
import 'package:dlx/view/screens/landing_screen.dart';
import 'package:dlx/view/screens/map_screen.dart';
import 'package:dlx/view/widgets/shipment_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllShipmentScreen extends StatelessWidget {
  final String shipmentId;

  const AllShipmentScreen({Key? key, required this.shipmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final auth = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          'DLX',
          style:
              Theme.of(context).textTheme.headline6!.copyWith(color: mainColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              auth.logout().then((value) {
                navigateAndFinish(context, const LandingScreen());
              });
            },
            icon: const Icon(
              Icons.logout,
              color: mainColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<Shipment>>(
          stream: database.allShipmentStream(shipmentId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final shipment = snapshot.data;
              if (shipment == null || shipment.isEmpty) {
                return const Center(
                  child: Text('No Data Available!'),
                );
              }
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          navigateTo(
                            context,
                            MapScreen(
                              longitude: shipment[index].longitude,
                              latitude: shipment[index].latitude,
                            ),
                          );
                        },
                        child: ShipmentItem(
                          shipment: shipment[index],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                  itemCount: shipment.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
