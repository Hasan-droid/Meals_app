import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelect});

  final Category category;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => onSelect(),
      splashColor: Theme.of(context).colorScheme.primaryFixed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.7),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      ),
    );
  }
}
