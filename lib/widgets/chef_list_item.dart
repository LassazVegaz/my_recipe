import 'package:flutter/material.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/pages/chef_view_page.dart';
import 'package:my_recipe/theme.dart';

class ChefListItem extends StatelessWidget {
  final Chef chef;

  const ChefListItem({
    Key? key,
    required this.chef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: listItemBackground,
        borderRadius: listItemBorderRadius,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/chef.jpg'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${chef.firstName} ${chef.lastName}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 4),
                Text(
                  chef.email,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ChefViewPage.path, arguments: chef.id);
            },
            icon: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
