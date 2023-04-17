import 'package:flutter/material.dart';
import 'package:food/screen/category_meals_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';

class categoriesItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;
  const categoriesItem({
    super.key,
    required this.category,
    required this.meals,
  });

  void _goToCategoryMealsScreen(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => CategoryMealsScreen(
    //       categoryName: category.title,
    //     ),
    //   ),
    // );
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeNamed, arguments: {
      'categoryTitle': category.title, 
      'categoryMeals': meals,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
