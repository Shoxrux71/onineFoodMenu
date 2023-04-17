import 'package:flutter/material.dart';
import 'package:food/models/category.dart';
import 'package:food/screen/tabs_screen.dart';
import './screen/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import './screen/category_meals_screen.dart';
import './models/meal.dart';
import './screen/meals_details_screen.dart';
import './screen/tabs_screen.dart';
import './screen/products_screen.dart';
import './screen/add_new_product_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categoryModel = Categories();

  final _mealModel = Meals();

  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavorite(String mealId) {
    return _mealModel.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }

  void _deleteMeal(String id) {
    setState(() {
      _mealModel.deleteMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_mealModel.favorites);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.adventPro().fontFamily,
      ),
      // home: CategoriesScreen(
      //     categories: _categoryModel.list, meals: _mealModel.list),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
              categories: _categoryModel.list,
              mealModel: _mealModel,
              toggleLike: _toggleLike,
              isLike: _isFavorite,
            ),
        CategoryMealsScreen.routeNamed: (ctx) => CategoryMealsScreen(
            toggleLike: _toggleLike, isFavorite: _isFavorite),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        ProductsScreen.routeName: (ctx) =>
            ProductsScreen(meals: _mealModel.list, deleteMeal: _deleteMeal),
        AddNewProductScreen.routeName: (ctx) => AddNewProductScreen(
              categories: _categoryModel.list,
              addFunction: _addNewMeal,
            ),
      },
      onGenerateRoute: (settings) {},
    );
  }
}
// 15:00 minutda toxtadim,ertalab davm etiraman.favoritlani TabsCREENGA YUBORISH JARAYONI