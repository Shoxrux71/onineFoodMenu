import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screen/meals_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavorite;
  const MealItem({
    super.key,
    required this.meal,
    required this.toggleLike,
    required this.isFavorite,
  });

  void _gooToMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gooToMealDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Stack(
                children: [
                  meal.imageUrls[0].startsWith("assets/")
                      ? Image.asset(
                          meal.imageUrls[0],
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          meal.imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 160,
                      padding: EdgeInsets.all(10),
                      color: Colors.red.withOpacity(0.5),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => toggleLike(meal.id),
                      icon: Icon(
                        isFavorite(meal.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                    Text("${meal.prepairingTime} minutes"),
                    Text("\$${meal.price} "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
