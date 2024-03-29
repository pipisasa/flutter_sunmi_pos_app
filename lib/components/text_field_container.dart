import 'package:boomerang_pos/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: limeGreen.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
