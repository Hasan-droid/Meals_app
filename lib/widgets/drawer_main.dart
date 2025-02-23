import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key, required this.onSelectScreen});

  final void Function(String screen) onSelectScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withAlpha((0.6 * 255).toInt())
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant,
                size: 24, color: Theme.of(context).colorScheme.primary),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                size: 24, color: Theme.of(context).colorScheme.primary),
            title: Text(
              "filters",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
