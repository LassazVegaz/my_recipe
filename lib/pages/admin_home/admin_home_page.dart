import 'package:flutter/material.dart';
import 'package:my_recipe/pages/admin_home/widgets/menu_item.dart';

class AdminHomePage extends StatelessWidget {
  static const path = '/admin_home';

  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const AdminMenuItem(
            title: 'View Chefs',
            image: 'assets/chef.jpg',
          ),
          const AdminMenuItem(
            title: 'View Users',
            image: 'assets/users.jpg',
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Log Out'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
