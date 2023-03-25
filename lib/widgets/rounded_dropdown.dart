import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class RoundedDropdown<T> extends StatelessWidget {
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  final List<DropdownMenuItem<T>>? items;
  final T? value;

  const RoundedDropdown({
    Key? key,
    this.items,
    this.onChanged,
    this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      isExpanded: true,
      validator: validator,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: fieldBorderRadius,
        ),
      ),
    );
  }
}
