import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItemTreat extends StatelessWidget {
  const MealItemTreat({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
    );
  }
}
