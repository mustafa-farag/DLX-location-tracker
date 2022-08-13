import 'package:dlx/utilities/colors.dart';
import 'package:dlx/view/widgets/default_button.dart';
import 'package:dlx/view/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top:80,bottom: 10,right: 20,left: 20),
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
            const SizedBox(height: 40,),
            DefaultTextFormField(
                controller: nameController,
                type: TextInputType.text,
                labelText: "name"),
            const SizedBox(height: 30,),
            DefaultTextFormField(
                controller: nameController,
                type: TextInputType.number,
                labelText: "age"),
            const SizedBox(height: 30,),
            DefaultTextFormField(
                controller: nameController,
                type: TextInputType.phone,
                labelText: "phone"),
            const SizedBox(height: 60,),
            DefaultButton(onPressed: (){}, text: 'Save Changes')
          ],
        ),
      ),
    );
  }
}
