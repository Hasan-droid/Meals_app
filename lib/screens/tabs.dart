import 'package:flutter/material.dart';

import 'package:meals/screens/categoriesScreen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/mealsScreen.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/drawer_main.dart';
import 'package:meals/data/dummy_data.dart';

const kInitialFilters = {
  MealFilters.glutenFree: false,
  MealFilters.lactoseFree: false,
  MealFilters.vegetarian: false,
  MealFilters.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabState();
}

class _TabState extends State<Tabs> {
  final List<Meal> _favoriteMealsList = [];
  Map<MealFilters, bool> _selectedFilters = kInitialFilters;

  var currentTabIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  void selectTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void toggleFavorite(Meal) {
    final existingMeal = _favoriteMealsList.contains(Meal);

    if (existingMeal) {
      setState(() {
        _favoriteMealsList.remove(Meal);
        _showInfoMessage('Removed from favorites');
      });
    } else {
      setState(() {
        _favoriteMealsList.add(Meal);
        _showInfoMessage('Added to favorites');
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final results = await Navigator.of(context).push<Map<MealFilters, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = results ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[MealFilters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[MealFilters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[MealFilters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[MealFilters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    var title = 'Categories';
    Widget activeScreen = CategoriesScreen(
      toggleFavorite: toggleFavorite,
      availableMeals: availableMeals,
    );
    if (currentTabIndex == 1) {
      title = 'Favorites';
      activeScreen =
          MealsScreen(mealsList: _favoriteMealsList, toggleFavorite: toggleFavorite);
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
