import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/categoriesScreen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/mealsScreen.dart';
import 'package:meals/widgets/drawer_main.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/filters_provider.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabState();
}

class _TabState extends ConsumerState<Tabs> {
  var currentTabIndex = 0;

  void selectTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = dummyMeals.where((meal) {
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

    var title = 'Categories';
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    if (currentTabIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      title = 'Favorites';
      activeScreen = MealsScreen(mealsList: favoriteMeals);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: DrawerMain(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        currentIndex: currentTabIndex,
        onTap: (currentTabIndex) {
          selectTab(currentTabIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
