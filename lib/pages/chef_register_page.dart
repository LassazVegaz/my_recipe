import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

class ChefRegisterPage extends StatelessWidget {
  const ChefRegisterPage({Key? key}) : super(key: key);

  static const path = '/chef_register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Register as a Chef',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/chef.jpg'),
              ),
              const SizedBox(height: 50),
              Row(
                children: const [
                  Expanded(
                    child: OutlinedTextField(
                      hintText: 'First name',
                    ),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: OutlinedTextField(
                      hintText: 'Last name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const OutlinedTextField(
                hintText: 'Email',
              ),
              const SizedBox(height: 24),
              const OutlinedTextField(
                hintText: 'Password',
              ),
              const SizedBox(height: 24),
              const OutlinedTextField(
                hintText: 'Confirm password',
              ),
            ],
          ),
        ));
  }
}
