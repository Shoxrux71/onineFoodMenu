import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widget/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> meals;
  final List<Category> categories;
  const CategoriesScreen(
      {super.key, required this.categories, required this.meals});

  @override
  Widget build(BuildContext context) {
    return categories.length > 0
        ? GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: categories.map((category) {
              final categoryMeals = meals
                  .where((meal) => meal.categoryId == category.id)
                  .toList();
              return categoriesItem(category: category, meals: categoryMeals);
            }).toList(),
          )
        : const Center(
            child: Text("Menyu mavjud emasl"),
          );
  }
}
