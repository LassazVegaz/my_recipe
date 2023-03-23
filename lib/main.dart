import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/firebase_options.dart';
import 'package:my_recipe/pages/chef_register_page.dart';
import 'package:my_recipe/pages/chef_view_page.dart';
import 'package:my_recipe/pages/chefs_list_page.dart';
import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/pages/sample_page.dart';
import 'package:my_recipe/pages/user_register_page.dart';
import 'package:my_recipe/pages/user_view_page.dart';
import 'package:my_recipe/pages/users_list_page.dart';
import 'package:my_recipe/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe',
      theme: themeData,
      initialRoute: LoginPage.path,
      routes: {
        SampleScreen.path: (context) => const SampleScreen(),
        ChefRegisterPage.path: (context) => const ChefRegisterPage(),
        ChefsListPage.path: (context) => const ChefsListPage(),
        ChefViewPage.path: (context) => const ChefViewPage(),
        LoginPage.path: (context) => const LoginPage(),
        UserRegisterPage.path: (context) => const UserRegisterPage(),
        UsersListPage.path: (context) => const UsersListPage(),
        UserViewPage.path: (context) => const UserViewPage(),
      },
    );
  }
}
