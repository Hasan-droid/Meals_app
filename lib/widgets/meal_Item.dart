import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_treat.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/screens/meal_detailsScreen.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => {
          selectMeal(context),
        },
        child: Stack(
          children: [
            Hero(
              tag: ValueKey(meal.id),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: 300,
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTreat(
                            icon: Icons.schedule_outlined,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTreat(
                            icon: Icons.shopping_bag,
                            label: meal.affordability.name),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTreat(
                            icon: Icons.work_outline,
                            label: meal.complexity.name),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
