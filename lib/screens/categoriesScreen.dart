import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/mealsScreen.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.toggleFavorite, required this.availableMeals});

  final List<Meal> availableMeals;
  final Function(Meal meal) toggleFavorite;
  void _selectCategory(BuildContext context, Category category) {
    final filteredItems =
        availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              mealsList: filteredItems,
              title: category.title,
              toggleFavorite: toggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        ...availableCategories.map((category) => CategoryGridItem(
            category: category,
            onSelect: () {
              _selectCategory(context, category);
            }))
      ],
    );
  }
}
