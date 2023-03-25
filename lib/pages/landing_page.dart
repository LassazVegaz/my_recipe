import 'package:flutter/material.dart';
import 'package:my_recipe/enums/role_enum.dart';
import 'package:my_recipe/pages/admin_home/admin_home_page.dart';
import 'package:my_recipe/pages/chef_view/chef_view_page.dart';
import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/pages/user_home_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';

final _authRepo = AuthRrepository.instance;

class LandingPage extends StatefulWidget {
  static const path = '/landing';

  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _initRouting() async {
    await _authRepo.setRole();

    if (!mounted) return;

    switch (_authRepo.role) {
      case Role.admin:
        Navigator.pushReplacementNamed(context, AdminHomePage.path);
        break;
      case Role.chef:
        Navigator.pushReplacementNamed(context, ChefViewPage.path);
        break;
      case Role.user:
        Navigator.pushReplacementNamed(context, UserHomePage.path);
        break;
      default:
        Navigator.pushReplacementNamed(context, LoginPage.path);
    }
  }

  @override
  void initState() {
    super.initState();
    _initRouting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/chef_user_home.png"),
      ),
    );
  }
}
