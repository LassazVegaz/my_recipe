import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class RoundedDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  const RoundedDropdown({
    Key? key,
    this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged,
      isExpanded: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: fieldBorderRadius,
        ),
      ),
    );
  }
}
