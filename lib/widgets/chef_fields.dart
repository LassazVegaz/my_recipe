import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';
import 'package:my_recipe/widgets/rounded_multiselect.dart';

class ChefFields extends StatelessWidget {
  final void Function(String?)? onGenderChanged;

  final TextEditingController? firstNameController,
      lastNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController;
  final String? gender;
  final bool isEditing;

  const ChefFields({
    Key? key,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.phoneNumberController,
    this.onGenderChanged,
    this.gender,
    this.isEditing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/chef.jpg'),
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: OutlinedTextField(
                hintText: 'First name',
                controller: firstNameController,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: OutlinedTextField(
                hintText: 'Last name',
                controller: lastNameController,
              ),
            ),
          ],
        ),
        const SizedBox(height: fieldVerticalGap),
        OutlinedTextField(
          hintText: 'Email',
          controller: emailController,
        ),
        const SizedBox(height: fieldVerticalGap),
        isEditing
            ? Container()
            : Column(
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
                    validator: (v) {
                      if (v != passwordController?.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: fieldVerticalGap),
                ],
              ),
        OutlinedTextField(
          hintText: 'Phone number',
          controller: phoneNumberController,
        ),
        const SizedBox(height: fieldVerticalGap),
        GenderField(
          value: gender,
          onChanged: onGenderChanged,
        ),
        const SizedBox(height: fieldVerticalGap),
        RoundedMultiSelect(
          items: [
            MultiSelectItem('Italian', 'Italian'),
            MultiSelectItem('Chinese', 'Chinese'),
          ],
          title: 'Select your cuisine',
          buttonText: 'Food types',
          onConfirm: (p0) {},
        ),
      ],
    );
  }
}
