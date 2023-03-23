import 'package:flutter/material.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/repositories/users_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

const _avatarRadius = 75.0;
const _pageMarginTop = 150.0;
const _avatarMarginTop = _pageMarginTop - _avatarRadius;

final _usersRepo = UsersRepository.instance;

class UserRegisterPage extends StatelessWidget {
  static const path = '/user_register';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _addressController = TextEditingController();

  UserRegisterPage({Key? key}) : super(key: key);

  void _onSignUpClick(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    var user = NormalUser(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneNumberController.text,
      address: _addressController.text,
      gender: "male",
    );

    await _usersRepo.createUser(user, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: primaryColor,
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: pagePaddingHorizental,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 150),
                          UserFields(
                            fullNameController: _nameController,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            confirmPasswordController:
                                _confirmPasswordController,
                            phoneNumberController: _phoneNumberController,
                            addressController: _addressController,
                          ),
                          const SizedBox(height: 50),
                          Buttons(
                            onSignUp: () => _onSignUpClick(context),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PositionedProfilePic(),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final VoidCallback? onSignUp;

  const Buttons({
    Key? key,
    this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: onSignUp,
            child: const Text('Sign Up'),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ],
    );
  }
}

class PositionedProfilePic extends StatelessWidget {
  const PositionedProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _avatarMarginTop,
      left: MediaQuery.of(context).size.width / 2 - _avatarRadius,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primaryColor,
              blurRadius: 15,
              offset: Offset(0, 0),
              spreadRadius: 2,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: _avatarRadius,
          backgroundImage: AssetImage('assets/user.png'),
        ),
      ),
    );
  }
}
