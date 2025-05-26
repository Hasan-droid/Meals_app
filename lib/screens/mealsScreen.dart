import "package:flutter/material.dart";
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_Item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.mealsList, this.title});

  final List<Meal> mealsList;
  final String? title;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index) => MealItem(meal: mealsList[index]));

    if (mealsList.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "oops! No meals found here",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Try other categories",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
    // body: );
  }
}
