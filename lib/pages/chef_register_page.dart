import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_recipe/theme.dart';
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
        body: SingleChildScrollView(
          child: Padding(
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
                const SizedBox(height: 24),
                const OutlinedTextField(
                  hintText: 'Phone number',
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      value: null,
                      child: Text('Gender'),
                    ),
                    DropdownMenuItem(
                      value: 'male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'female',
                      child: Text('Female'),
                    ),
                  ],
                  onChanged: (value) {},
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: fieldBorderRadius,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                MultiSelectDialogField(
                  items: [
                    MultiSelectItem('Italian', 'Italian'),
                    MultiSelectItem('Chinese', 'Chinese'),
                  ],
                  title: const Text('Select your cuisine'),
                  buttonText: const Text('Food types'),
                  selectedColor: themeData.colorScheme.primary,
                  onConfirm: (p0) {},
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: fieldBorderRadius,
                  ),
                  buttonIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ),
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
        ));
  }
}
