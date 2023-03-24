import 'package:flutter/material.dart';
import 'package:my_recipe/pages/admin_home/widgets/menu_item.dart';
import 'package:my_recipe/pages/chefs_list_page.dart';
import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/pages/users_list/users_list_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';

final _authRepo = AuthRrepository.instance;

class AdminHomePage extends StatefulWidget {
  static const path = '/admin_home';

  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  void _onLogoutPressed() async {
    await _authRepo.signOut();

    if (!mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginPage.path,
      (route) => false,
    );
  }

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
          AdminMenuItem(
            title: 'View Chefs',
            image: 'assets/chef.jpg',
            onPressed: () {
              Navigator.of(context).pushNamed(ChefsListPage.path);
            },
          ),
          AdminMenuItem(
            title: 'View Users',
            image: 'assets/users.jpg',
            onPressed: () {
              Navigator.of(context).pushNamed(UsersListPage.path);
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: _onLogoutPressed,
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
