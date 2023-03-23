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
  final String? gender;
  final void Function(String?)? onGenderChanged;

  const UserFields({
    Key? key,
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.phoneNumberController,
    this.addressController,
    this.gender,
    this.onGenderChanged,
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
          validator: (value) {
            if (value != passwordController?.text) {
              return 'Passwords do not match';
            }
            return null;
          },
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
        GenderField(
          onChanged: onGenderChanged,
          value: gender,
        ),
      ],
    );
  }
}
