import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserHomePage extends StatelessWidget {
  static const path = '/user_home';

  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Back'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Hiruni Mudannayake',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 30),
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
              onPressed: () {},
              child: const Text('View Chefs'),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Manage Profile'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ));
  }
}
