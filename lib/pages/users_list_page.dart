import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class UsersListPage extends StatelessWidget {
  static const path = '/users_list';

  const UsersListPage({Key? key}) : super(key: key);

  AccordionSection _buildAccordion(BuildContext context) {
    return AccordionSection(
      isOpen: true,
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'John McArthy',
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
          children: const [
            DataRow(label: "Email", value: "john@c.com"),
            SizedBox(height: 8),
            DataRow(label: "Phone", value: "123456789"),
            SizedBox(height: 8),
            DataRow(label: "Address", value: "123 Street"),
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
        children: [
          _buildAccordion(context),
          _buildAccordion(context),
          _buildAccordion(context),
          _buildAccordion(context),
        ],
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  final String label;
  final String value;

  const DataRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(value),
      ],
    );
  }
}
