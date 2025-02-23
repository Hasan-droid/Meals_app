import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.toggleFavorite});

  final Meal meal;
  final Function(Meal) toggleFavorite;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              toggleFavorite!(meal);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(meal.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(meal.title),
            SizedBox(height: 10),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(ingredient,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSurface)),
              ),
            SizedBox(height: 10),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSurface)),
              ),
          ],
        ),
      ),
    );
  }
}
