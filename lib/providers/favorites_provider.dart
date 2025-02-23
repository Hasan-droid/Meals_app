import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteState(Meal meal) {
    final existingMeal = state.contains(meal);

    if (existingMeal) {
      state = List.from(state)..remove(meal);
    } else {
      state = List.from(state)..add(meal);
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
    (ref) => FavoriteMealsNotifier());
