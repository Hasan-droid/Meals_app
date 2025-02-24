import 'package:riverpod/riverpod.dart';

enum MealFilters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<MealFilters, bool>> {
  FiltersNotifier()
      : super({
          MealFilters.glutenFree: false,
          MealFilters.lactoseFree: false,
          MealFilters.vegetarian: false,
          MealFilters.vegan: false,
        });

  void setFilter(MealFilters filter, bool value) {
    state = {
      ...state,
      filter: value,
    };
  }

  void setFilters(Map<MealFilters, bool> filters) {
    state = filters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<MealFilters, bool>>(
    (ref) => FiltersNotifier());
