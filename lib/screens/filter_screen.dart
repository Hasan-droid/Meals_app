import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FiltersScreen();
}

class _FiltersScreen extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final filters = ref.read(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: filters[MealFilters.glutenFree]!,
              onChanged: (isChecked) {
                setState(() {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(MealFilters.glutenFree, isChecked);
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
              value: filters[MealFilters.vegan]!,
              onChanged: (isChecked) {
                setState(() {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(MealFilters.vegan, isChecked);
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
              value: filters[MealFilters.vegetarian]!,
              onChanged: (isChecked) {
                setState(() {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(MealFilters.vegetarian, isChecked);
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
              value: filters[MealFilters.lactoseFree]!,
              onChanged: (isChecked) {
                setState(() {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(MealFilters.lactoseFree, isChecked);
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
