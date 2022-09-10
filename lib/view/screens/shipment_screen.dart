import 'package:dlx/controllers/location_controller.dart';
import 'package:dlx/services/auth.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:dlx/utilities/constant.dart';
import 'package:dlx/view/screens/all_shipment.dart';
import 'package:dlx/view/screens/landing_screen.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:dlx/view/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

class ShipmentScreen extends StatelessWidget {
  const ShipmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<LocationController>(
      create: (_) => LocationController(),
      child: Consumer<LocationController>(
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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Be sure that you are opening your GPS',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        'assets/images/shipment.gif',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter shipment ID',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextFormField(
                        controller: idController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'this field can not be empty';
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        labelText: "ID",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DefaultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            model.getCurrentLocation().then((value) {
                              model.startShipment(
                                shipmentId: idController.text,
                                date: formatDate(
                                    DateTime.now(), [HH, ':', nn, ':', ss],),
                              ).then((value) {
                                navigateTo(
                                    context,
                                    AllShipmentScreen(
                                        shipmentId: idController.text));
                              });
                            });
                          }
                        },
                        text: 'Start',
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
