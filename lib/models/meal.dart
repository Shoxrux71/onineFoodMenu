class Meal {
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final int prepairingTime;
  final double price;
  final String categoryId;
  final List<String> ingredients;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.description,
    required this.prepairingTime,
    required this.price,
    required this.categoryId,
    required this.ingredients,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
        id: "m1",
        title: "Lavash",
        imageUrls: [
          'assets/images/lavash.jpg',
          'assets/images/lavash2.jpg',
          'assets/images/lavash3.jpg',
        ],
        description: "Sirli Lavash",
        prepairingTime: 12,
        price: 18,
        categoryId: 'c1',
        ingredients: [
          "Mol o'shti",
          "sir",
          "pamidor",
          "bodring",
          "mayonez",
        ]),
    Meal(
        id: "m2",
        title: "Burger",
        imageUrls: [
          'assets/images/burger.jpg',
          'assets/images/burger2.jpg',
          'assets/images/burger3.jpg',
        ],
        description: "Sirli Burger",
        prepairingTime: 20,
        price: 15,
        categoryId: 'c1',
        ingredients: [
          "Mol o'shti",
          "sir",
          "pamidor",
          "bodring",
          "mayonez",
        ]),
    Meal(
        id: "m3",
        title: "Palov",
        imageUrls: [
          'assets/images/osh.jpg',
          'assets/images/osh2.jpg',
          'assets/images/osh3.jpg',
        ],
        description: "Sirli Osh",
        prepairingTime: 12,
        price: 20,
        categoryId: 'c2',
        ingredients: [
          "Mol o'shti",
          "Sariq sabzi",
          "qazi",
        ]),
    Meal(
        id: "m4",
        title: "Pizza",
        imageUrls: [
          'assets/images/pizza.jpg',
          'assets/images/pizza2.jpg',
          'assets/images/pizza3.jpg',
        ],
        description: "Sirli Somsa",
        prepairingTime: 12,
        price: 22,
        categoryId: 'c3',
        ingredients: [
          "Mol o'shti",
          "Piyoz",
          "dumba",
          "ziravorlar",
        ]),
    Meal(
        id: "m5",
        title: "ratatuy",
        imageUrls: [
          'assets/images/french.jpg',
          'assets/images/french2.jpg',
          'assets/images/french3.jpg',
        ],
        description: "Sirli Pizaa",
        prepairingTime: 12,
        price: 20,
        categoryId: 'c4',
        ingredients: [
          "pishloq",
          "kalbasa",
          "qo'ziqorin",
        ]),
    Meal(
        id: "m6",
        title: "Cola",
        imageUrls: [
          'assets/images/cola.jpg',
          'assets/images/cola2.jpg',
          'assets/images/cola3.jpg',
        ],
        description: "Muzdek Cola",
        prepairingTime: 12,
        price: 10,
        categoryId: 'c5',
        ingredients: ["Cola suvi,"]),
    Meal(
        id: "m7",
        title: "Fanta",
        imageUrls: [
          'assets/images/fanta.jpg',
          'assets/images/fanta2.jpg',
          'assets/images/fanta3.jpg',
        ],
        description: "Muzdek Fanta",
        prepairingTime: 12,
        price: 9,
        categoryId: 'c5',
        ingredients: [
          "Cola suvi",
        ]),
    Meal(
      id: "m8",
      title: "Salat",
      imageUrls: [
        'assets/images/salat.jpg',
        'assets/images/salat2.jpg',
        'assets/images/salat3.jpg',
      ],
      description: "Fransuzcha Salat",
      prepairingTime: 12,
      price: 20,
      categoryId: 'c6',
      ingredients: [
        "Pamidor",
        "Bodring",
        "Sallat bargi",
      ],
    ),
  ];

  List<Meal> _favorites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favorites {
    return _favorites;
  }

  void toggleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    print(mealIndex);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deleteMeal(String id) {
    _list.removeWhere((meal) => meal.id == id);
  }
}
