import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/pages/users_list/widgets/data_row.dart';
import 'package:my_recipe/repositories/users_repo.dart';
import 'package:my_recipe/theme.dart';

final _usersRepo = UsersRepository.instance;

class UsersListPage extends StatefulWidget {
  static const path = '/users_list';

  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<NormalUser> users = [];

  AccordionSection _buildAccordion(BuildContext context, NormalUser user) {
    return AccordionSection(
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          Text(
            '26 Years',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            UserDataRow(label: "Email", value: user.email),
            const SizedBox(height: 8),
            UserDataRow(label: "Phone", value: user.phone),
            const SizedBox(height: 8),
            UserDataRow(label: "Address", value: user.address),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _usersRepo.getAllUsers().then((v) => setState(() => users = v));
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: Accordion(
        maxOpenSections: 1,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerBackgroundColor: listItemBackground,
        contentBackgroundColor: listItemBackground,
        contentBorderColor: const Color.fromARGB(255, 212, 212, 212),
        contentBorderWidth: 2,
        headerPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 25),
        contentHorizontalPadding: 50,
        contentVerticalPadding: 20,
        paddingBetweenClosedSections: 20,
        paddingBetweenOpenSections: 20,
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        rightIcon: const Icon(Icons.keyboard_arrow_down),
        children: users.map((u) => _buildAccordion(context, u)).toList(),
      ),
    );
  }
}
