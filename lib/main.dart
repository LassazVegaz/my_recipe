import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/firebase_options.dart';
import 'package:my_recipe/pages/admin_home/admin_home_page.dart';
import 'package:my_recipe/pages/chef_register_page.dart';
import 'package:my_recipe/pages/chef_view/chef_view_page.dart';
import 'package:my_recipe/pages/chefs_list_page.dart';

import 'package:my_recipe/pages/landing_page.dart';
import 'package:my_recipe/pages/add_recipe_page.dart';
import 'package:my_recipe/pages/view_recipe_page.dart';
import 'package:my_recipe/pages/recipe_list_page.dart';

import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/pages/sample_page.dart';
import 'package:my_recipe/pages/user_home_page.dart';
import 'package:my_recipe/pages/user_register/user_register_page.dart';
import 'package:my_recipe/pages/user_view/user_view_page.dart';
import 'package:my_recipe/pages/users_list/users_list_page.dart';
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

      initialRoute: LandingPage.path,

      routes: {
        SampleScreen.path: (context) => const SampleScreen(),
        ChefRegisterPage.path: (context) => const ChefRegisterPage(),
        ChefsListPage.path: (context) => const ChefsListPage(),
        ChefViewPage.path: (context) => const ChefViewPage(),
        LoginPage.path: (context) => const LoginPage(),

        UserRegisterPage.path: (context) => const UserRegisterPage(),
        UsersListPage.path: (context) => const UsersListPage(),
        UserViewPage.path: (context) => const UserViewPage(),
        UserHomePage.path: (context) => const UserHomePage(),
        AdminHomePage.path: (context) => const AdminHomePage(),
        LandingPage.path: (context) => const LandingPage(),
        AddRecipePage.path: (context) => const AddRecipePage(),
        RecipeListPage.path: (context) => const RecipeListPage(),
        ViewRecipePage.path: (context) => const ViewRecipePage(),

      },
    );
  }
}
