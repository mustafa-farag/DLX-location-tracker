import 'package:dlx/model/shipment.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:flutter/material.dart';

class ShipmentItem extends StatelessWidget {
  final Shipment shipment;

  const ShipmentItem({Key? key, required this.shipment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin:const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: Text('ID',style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(width: 40,),
                Text(
                  shipment.id,
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: mainColor,
                  child: Text('time',style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(width: 40,),
                Text(
                  shipment.date.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
