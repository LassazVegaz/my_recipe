import 'package:flutter/material.dart';
import 'package:my_recipe/pages/chef_view/widgets/buttons.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

class ChefViewPage extends StatefulWidget {
  static const path = '/chef_view';

  const ChefViewPage({Key? key}) : super(key: key);

  @override
  State<ChefViewPage> createState() => _ChefViewPageState();
}

class _ChefViewPageState extends State<ChefViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiruni Mudannayake'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePaddingHorizental,
          ),
          child: Column(
            children: const [
              SizedBox(height: 30),
              ChefFields(),
              SizedBox(height: 40),
              Buttons(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
