import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

class UserFields extends StatelessWidget {
  final void Function(String?)? onGenderChanged;

  final TextEditingController? fullNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController,
      addressController;
  final String? gender;
  final bool isEditing;

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
    this.isEditing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedTextField(
          hintText: 'Full name',
          controller: fullNameController,
        ),
        const SizedBox(height: fieldVerticalGap),
        OutlinedTextField(
          hintText: 'Email',
          controller: emailController,
          readOnly: isEditing,
          validator: (value) {
            if (isEditing) return null;

            if (!EmailValidator.validate(value!)) {
              return 'Email is invalid';
            }

            return null;
          },
        ),
        const SizedBox(height: fieldVerticalGap),
        !isEditing
            ? Column(
                children: [
                  OutlinedTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: fieldVerticalGap),
                  OutlinedTextField(
                    hintText: 'Confirm password',
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != passwordController?.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: fieldVerticalGap),
                ],
              )
            : Container(),
        OutlinedTextField(
          hintText: 'Phone number',
          controller: phoneNumberController,
        ),
        const SizedBox(height: fieldVerticalGap),
        OutlinedTextField(
          hintText: 'Address',
          controller: addressController,
        ),
        const SizedBox(height: fieldVerticalGap),
        GenderField(
          onChanged: onGenderChanged,
          value: gender,
        ),
      ],
    );
  }
}
