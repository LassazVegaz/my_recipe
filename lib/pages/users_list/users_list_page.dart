import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/pages/user_view/user_view_page.dart';
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
  var users = _usersRepo.listenToUsers();

  AccordionSection _buildAccordion(BuildContext context, NormalUser user) {
    var gender = user.gender[0].toUpperCase() + user.gender.substring(1);

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
            gender,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataRow(label: "Email", value: user.email),
                const SizedBox(height: 8),
                UserDataRow(label: "Phone", value: user.phone),
                const SizedBox(height: 8),
                UserDataRow(label: "Address", value: user.address),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UserViewPage.path,
                    arguments: user.id);
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: StreamBuilder<List<NormalUser>>(
          stream: users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Accordion(
                maxOpenSections: 1,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerBackgroundColor: listItemBackground,
                contentBackgroundColor: listItemBackground,
                contentBorderColor: const Color.fromARGB(255, 212, 212, 212),
                contentBorderWidth: 2,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 25),
                contentHorizontalPadding: 50,
                contentVerticalPadding: 20,
                paddingBetweenClosedSections: 20,
                paddingBetweenOpenSections: 20,
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                rightIcon: const Icon(Icons.keyboard_arrow_down),
                children: snapshot.data!
                    .map((u) => _buildAccordion(context, u))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
