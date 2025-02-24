import 'package:riverpod/riverpod.dart';
import 'package:meals/data/dummy_data.dart';

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

final filteredMealsProvider = Provider((ref) {
  final activeFilters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (activeFilters[MealFilters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[MealFilters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[MealFilters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[MealFilters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
