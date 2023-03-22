import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

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
        child: Container(
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
                    const OutlinedTextField(hintText: 'Confirm Password'),
                    const SizedBox(height: 30),
                    const OutlinedTextField(hintText: 'Phone number'),
                    const SizedBox(height: 30),
                    const OutlinedTextField(hintText: 'Address'),
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
      ),
    );
  }
}
