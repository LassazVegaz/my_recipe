import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class OutlinedTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool compulsory;

  const OutlinedTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.compulsory = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (compulsory && value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: fieldBorderRadius,
        ),
      ),
    );
  }
}
