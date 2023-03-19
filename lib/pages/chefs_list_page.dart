import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/chef_list_item.dart';

class ChefsListPage extends StatelessWidget {
  static const path = '/chefs_list';

  const ChefsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chefs'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ChefListItem();
        },
      ),
    );
  }
}
