import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class ChefListItem extends StatelessWidget {
  const ChefListItem({
    Key? key,
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
            radius: 50,
            backgroundImage: AssetImage('assets/chef.jpg'),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chef Name',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 4),
                Text(
                  'Chef Description',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
