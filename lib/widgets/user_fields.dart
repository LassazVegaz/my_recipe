import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

class UserFields extends StatelessWidget {
  const UserFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OutlinedTextField(hintText: 'Full name'),
        SizedBox(height: 30),
        OutlinedTextField(hintText: 'Email'),
        SizedBox(height: 30),
        OutlinedTextField(hintText: 'Password'),
        SizedBox(height: 30),
        OutlinedTextField(hintText: 'Confirm password'),
        SizedBox(height: 30),
        OutlinedTextField(hintText: 'Phone number'),
        SizedBox(height: 30),
        OutlinedTextField(hintText: 'Address'),
        SizedBox(height: 30),
        GenderField(),
      ],
    );
  }
}
