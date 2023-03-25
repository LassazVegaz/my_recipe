import 'package:flutter/material.dart';
import 'package:my_recipe/pages/chefs_list_page.dart';
import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/pages/user_view/user_view_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';
import 'package:my_recipe/repositories/users_repo.dart';

final _authRepo = AuthRrepository.instance;
final _userRepo = UsersRepository.instance;

class UserHomePage extends StatefulWidget {
  static const path = '/user_home';

  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String userName = '';

  void _fetchData() async {
    final user = await _userRepo.getUser(_authRepo.currentUser!.uid);
    setState(() => userName = user!.name);
  }

  void _onSignOutPressed() async {
    await _authRepo.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(LoginPage.path);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Welcome Back'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _onSignOutPressed,
              icon: const Icon(Icons.power_settings_new),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              userName,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(ChefsListPage.path),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/chef_user_home.png',
                        height: 250,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ChefsListPage.path),
                    child: const Text('View Chefs'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        UserViewPage.path,
                        arguments: _authRepo.currentUser!.uid,
                      );
                    },
                    child: const Text('Manage Profile'),
                  ),
                  // IconButton(
                  //   onPressed: _onSignOutPressed,
                  //   icon: const Icon(Icons.power_settings_new),
                  // ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ));
  }
}
