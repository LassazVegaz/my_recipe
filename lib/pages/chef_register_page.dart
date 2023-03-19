import 'package:flutter/material.dart';
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ChefFields(),
        ),
      ),
    );
  }
}
