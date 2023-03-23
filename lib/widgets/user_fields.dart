import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

class UserFields extends StatelessWidget {
  final TextEditingController? fullNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController,
      addressController;

  const UserFields({
    Key? key,
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.phoneNumberController,
    this.addressController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedTextField(
          hintText: 'Full name',
          controller: fullNameController,
        ),
        const SizedBox(height: 30),
        OutlinedTextField(
          hintText: 'Email',
          controller: emailController,
        ),
        const SizedBox(height: 30),
        OutlinedTextField(
          hintText: 'Password',
          controller: passwordController,
        ),
        const SizedBox(height: 30),
        OutlinedTextField(
          hintText: 'Confirm password',
          controller: confirmPasswordController,
        ),
        const SizedBox(height: 30),
        OutlinedTextField(
          hintText: 'Phone number',
          controller: phoneNumberController,
        ),
        const SizedBox(height: 30),
        OutlinedTextField(
          hintText: 'Address',
          controller: addressController,
        ),
        const SizedBox(height: 30),
        const GenderField(),
      ],
    );
  }
}
