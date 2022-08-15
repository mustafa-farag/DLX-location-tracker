import 'package:dlx/utilities/colors.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? val)? validate;
  final TextInputType type;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const DefaultTextFormField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.labelText,
      this.focusNode,
      this.textInputAction,
      this.validate,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: mainColor,
      focusNode: focusNode,
      validator: validate,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: Text(labelText),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
