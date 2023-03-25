import 'package:flutter/material.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/repositories/chefs_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_list_item.dart';

final _chefsRepo = ChefsRepository.instance;

class ChefsListPage extends StatefulWidget {
  static const path = '/chefs_list';

  const ChefsListPage({Key? key}) : super(key: key);

  @override
  State<ChefsListPage> createState() => _ChefsListPageState();
}

class _ChefsListPageState extends State<ChefsListPage> {
  final chefs = _chefsRepo.listenToChefs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chefs'),
      ),
      body: StreamBuilder<List<Chef>>(
        stream: chefs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final chef = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: pagePaddingHorizental,
                    vertical: 8,
                  ),
                  child: ChefListItem(chef: chef),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
