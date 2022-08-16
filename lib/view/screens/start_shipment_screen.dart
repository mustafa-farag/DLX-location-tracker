import 'package:dlx/model/user_data.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:dlx/view/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class StartShipmentScreen extends StatelessWidget {
  final String userId;
  const StartShipmentScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DLX",
          style:
              Theme.of(context).textTheme.headline6!.copyWith(color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'Start',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
