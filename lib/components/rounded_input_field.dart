import 'package:boomerang_pos/components/text_field_container.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final String? error;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldContainer(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            cursorColor: darkBlue,
            obscureText: obscureText,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: darkBlue.shade500,
              ),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              error!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
