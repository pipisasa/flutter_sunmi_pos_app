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
  final void Function()? onFocus;
  final void Function()? onBlur;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.error,
    this.onFocus,
    this.onBlur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldContainer(
          child: Focus(
            onFocusChange: (focused) {
              if (focused) {
                onFocus?.call();
              } else {
                onBlur?.call();
              }
            },
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              validator: validator,
              cursorColor: darkBlue,
              obscureText: obscureText,
              onTap: onFocus,
              onEditingComplete: onBlur,
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
