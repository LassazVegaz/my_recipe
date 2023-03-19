import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
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
        itemCount: 7,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pagePaddingHorizental,
              vertical: 8,
            ),
            child: ChefListItem(),
          );
        },
      ),
    );
  }
}
