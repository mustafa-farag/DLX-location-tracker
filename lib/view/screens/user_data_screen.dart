import 'package:dlx/controllers/auth_controller.dart';
import 'package:dlx/utilities/colors.dart';
import 'package:dlx/utilities/routes.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:dlx/view/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 80, bottom: 10, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Complete your date ',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: mainColor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DefaultTextFormField(
                          controller: nameController,
                          validate: (value){
                            if(value!.isEmpty){
                              return'this field can not be empty';
                            }
                            return null;
                          },
                          type: TextInputType.text,
                          labelText: "name"),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultTextFormField(
                          controller: ageController,
                          validate: (value){
                            if(value!.isEmpty){
                              return'this field can not be empty';
                            }
                            return null;
                          },
                          type: TextInputType.number,
                          labelText: "age"),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultTextFormField(
                          controller: phoneController,
                          validate: (value){
                            if(value!.isEmpty){
                              return'this field can not be empty';
                            }
                            return null;
                          },
                          type: TextInputType.phone,
                          labelText: "phone"),
                      const SizedBox(
                        height: 60,
                      ),
                      DefaultButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            model.setUserData(
                              name: nameController.text,
                              phone: phoneController.text,
                              age: ageController.text,
                            ).then((value) {
                              Navigator.of(context).pushNamed(AppRoutes.shipmentScreenRoute);
                            });
                          }
                        },
                        text: 'Save Changes',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
