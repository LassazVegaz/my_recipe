import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePaddingHorizental,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const ChefFields(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Register'),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Already have an account?'),
                  SizedBox(width: 8),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
