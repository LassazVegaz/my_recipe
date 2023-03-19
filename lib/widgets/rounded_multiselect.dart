import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_recipe/theme.dart';

class RoundedMultiSelect<T> extends StatelessWidget {
  final List<MultiSelectItem<T>> items;
  final String? title;
  final String? buttonText;
  final void Function(List<T>?) onConfirm;

  const RoundedMultiSelect({
    Key? key,
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<T>(
      items: items,
      title: Text(title ?? 'Select'),
      buttonText: Text(buttonText ?? 'Select'),
      selectedColor: themeData.colorScheme.primary,
      onConfirm: onConfirm,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: fieldBorderRadius,
      ),
      buttonIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    );
  }
}
