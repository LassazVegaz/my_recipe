import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_recipe/repositories/chefs_repo.dart';
import 'package:my_recipe/widgets/rounded_multiselect.dart';

final _chefRepo = ChefsRepository.instance;

class FoodListSelector extends StatefulWidget {
  final List<String> selectedFoodTypes;
  final void Function(List<String>) onSelected;

  const FoodListSelector({
    Key? key,
    this.selectedFoodTypes = const [],
    required this.onSelected,
  }) : super(key: key);

  @override
  State<FoodListSelector> createState() => _FoodListSelectorState();
}

class _FoodListSelectorState extends State<FoodListSelector> {
  List<String> _foodTypes = [];

  void _fetchFoodTypes() async {
    var foodTypes = await _chefRepo.getFoodTypes();
    setState(() => _foodTypes = foodTypes);
  }

  @override
  void initState() {
    super.initState();
    _fetchFoodTypes();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedMultiSelect(
      items: _foodTypes.map((e) => MultiSelectItem(e, e)).toList(),
      selectedItems: widget.selectedFoodTypes,
      title: 'Select your cuisine',
      buttonText: 'Food types',
      onConfirm: widget.onSelected,
    );
  }
}
