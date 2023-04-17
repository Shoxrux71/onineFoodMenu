import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModel;
  final Function toggleLike;
  final Function isLike;
  const TabsScreen(
      {super.key,
      required this.categories,
      required this.mealModel,
      required this.toggleLike,
      required this.isLike});

  static const routeName = '/';
  

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _tabIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(
            categories: widget.categories, meals: widget.mealModel.list),
        'title': 'Taomlar Menyusi',
      },
      {
        'page': FavoritesScreen(
          favorites: widget.mealModel.favorites,
          toggleLike: widget.toggleLike,
          isFavorite: widget.isLike,
        ),
        'title': 'Sevimli taomlar',
      }
    ];
  }

  void _changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_tabIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_tabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.more_horiz,
            ),
            label: "Taomlar",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: "Sevimli",
          ),
        ],
      ),
    );
  }
}
