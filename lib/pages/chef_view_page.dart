import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

class ChefViewPage extends StatelessWidget {
  static const path = '/chef_view';

  const ChefViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiruni Mudannayake'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePaddingHorizental),
          child: ChefFields(),
        ),
      ),
    );
  }
}
