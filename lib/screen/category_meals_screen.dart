import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryName;
  final Function toggleLike;
  final Function isFavorite;
  const CategoryMealsScreen({
    super.key,
    required this.toggleLike,
    required this.isFavorite,
  });
  static const routeNamed = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final categoryDate =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryDate['categoryTitle'];
    final meals = categoryDate['categoryMeals'] as List<Meal>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: meals.length > 0
          ? ListView.builder(
              padding: EdgeInsets.all(10),
              itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                toggleLike: toggleLike,
                isFavorite: isFavorite,
              ),
              itemCount: meals.length,
            )
          : const Center(
              child: Text('Ayni paytda bu taom menyuda qolmadi!'),
            ),
    );
  }
}
