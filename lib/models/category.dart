import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imageUrl;

  const Category({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}

class Categories {
  List<Category> _list = [
    Category(
        id: 'c1', title: 'Fast Food', imageUrl: 'assets/images/burger.jpg'),
    Category(
        id: 'c2', title: 'Milliy Taomlar', imageUrl: 'assets/images/osh.jpg'),
    Category(
        id: 'c3',
        title: 'Italiya Taomlar',
        imageUrl: 'assets/images/pizza.jpg'),
    Category(
        id: 'c4',
        title: 'Fransiya Taomlar',
        imageUrl: 'assets/images/french.jpg'),
    Category(
        id: 'c5', title: 'Ichimliklar', imageUrl: 'assets/images/cola.jpg'),
    Category(id: 'c6', title: 'Salatlar', imageUrl: 'assets/images/salat.jpg'),
  ];
  List<Category> get list {
    return _list;
  }
}
