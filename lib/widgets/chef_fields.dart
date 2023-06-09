import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/enums/role_enum.dart';
import 'package:my_recipe/pages/add_recipe_page.dart';
import 'package:my_recipe/pages/recipe_list_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/utils/validators.dart';
import 'package:my_recipe/widgets/food_list_selector.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/image_selector.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

final _authRepo = AuthRrepository.instance;

class ChefFields extends StatelessWidget {
  final void Function(String?)? onGenderChanged;
  final void Function(List<String>) onFoodTypesSelected;
  final void Function(String)? onImageSelected;

  final TextEditingController? firstNameController,
      lastNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController;
  final String? gender;
  final bool isEditing;
  final String? image;
  final List<String> foodTypes;

  const ChefFields({
    Key? key,
    required this.onFoodTypesSelected,
    this.foodTypes = const [],
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.phoneNumberController,
    this.onGenderChanged,
    this.gender,
    this.isEditing = false,
    this.image,
    this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userView = _authRepo.role == Role.user;

    return Column(
      children: [
        ImageSelector(
          image: image,
          defaultAssetImage: 'assets/chef.jpg',
          onImageSelected: onImageSelected,
          builder: (image) => CircleAvatar(
            radius: 75,
            backgroundImage: image,
          ),
        ),
        _authRepo.role == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  const SizedBox(height: 13),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddRecipePage.path);
                    },
                    child: const Text('View Recipes'),
                  ),
                ],
              ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: OutlinedTextField(
                hintText: 'First name',
                controller: firstNameController,
                readOnly: userView,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: OutlinedTextField(
                hintText: 'Last name',
                controller: lastNameController,
                readOnly: userView,
              ),
            ),
          ],
        ),
        const SizedBox(height: fieldVerticalGap),
        OutlinedTextField(
          hintText: 'Email',
          controller: emailController,
          readOnly: userView || isEditing,
          validator: (value) {
            if (isEditing) return null;

            if (!EmailValidator.validate(value!)) {
              return 'Email is invalid';
            }

            return null;
          },
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
          readOnly: userView,
          validator: (value) {
            if (!validatePhoneNumber(value!)) {
              return 'Phone number is invalid';
            }
            return null;
          },
        ),
        const SizedBox(height: fieldVerticalGap),
        GenderField(
          value: gender,
          onChanged: userView ? null : onGenderChanged,
        ),
        const SizedBox(height: fieldVerticalGap),
        FoodListSelector(
          selectedFoodTypes: foodTypes,
          onSelected: onFoodTypesSelected,
        ),
      ],
    );
  }
}
