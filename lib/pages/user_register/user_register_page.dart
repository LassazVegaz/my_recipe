import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/pages/user_register/widgets/buttons.dart';
import 'package:my_recipe/pages/user_register/widgets/positioned_profile_pic.dart';
import 'package:my_recipe/repositories/users_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

const _avatarRadius = 75.0;
const _pageMarginTop = 150.0;
const _avatarMarginTop = _pageMarginTop - _avatarRadius;

final _usersRepo = UsersRepository.instance;

class UserRegisterPage extends StatefulWidget {
  static const path = '/user_register';

  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _addressController = TextEditingController();

  void _onSignUpClick(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    var user = NormalUser(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneNumberController.text,
      address: _addressController.text,
      gender: "male",
    );

    try {
      await _usersRepo.createUser(user, _passwordController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully'),
          ),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again'),
        ),
      );
    }
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
            const PositionedProfilePic(
              top: _avatarMarginTop,
              radius: _avatarRadius,
            ),
          ],
        ),
      ),
    );
  }
}
