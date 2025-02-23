import 'package:flutter/material.dart';

enum MealFilters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<MealFilters, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FiltersScreen();
}

class _FiltersScreen extends State<FilterScreen> {
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[MealFilters.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[MealFilters.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[MealFilters.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[MealFilters.vegan]!;
  }

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            MealFilters.glutenFree: _glutenFreeFilterSet,
            MealFilters.lactoseFree: _lactoseFreeFilterSet,
            MealFilters.vegetarian: _vegetarianFreeFilterSet,
            MealFilters.vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan free meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetarian free meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose free meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
