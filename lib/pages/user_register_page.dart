import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/gender_field.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

const _avatarRadius = 75.0;
const _pageMarginTop = 150.0;
const _avatarMarginTop = _pageMarginTop - _avatarRadius;

class UserRegisterPage extends StatelessWidget {
  static const path = '/user_register';

  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
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
                    child: Column(
                      children: [
                        const SizedBox(height: 150),
                        const OutlinedTextField(hintText: 'Full name'),
                        const SizedBox(height: 30),
                        const OutlinedTextField(hintText: 'Email'),
                        const SizedBox(height: 30),
                        const OutlinedTextField(hintText: 'Password'),
                        const SizedBox(height: 30),
                        const OutlinedTextField(hintText: 'Confirm password'),
                        const SizedBox(height: 30),
                        const OutlinedTextField(hintText: 'Phone number'),
                        const SizedBox(height: 30),
                        const OutlinedTextField(hintText: 'Address'),
                        const SizedBox(height: 30),
                        const GenderField(),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: formButtonWidth,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Sign Up'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Sign In'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
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
            ),
          ],
        ),
      ),
    );
  }
}
