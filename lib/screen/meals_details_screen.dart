import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});
  static const routeName = '/meal-details';

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int ativeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                viewportFraction: 1,
                initialPage: ativeImageIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    ativeImageIndex = index;
                  });
                },
              ),
              items: meal.imageUrls.map(
                (image) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: image.startsWith("assets/")
                        ? Image.asset(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrls.map((image) {
                final imageIndex = meal.imageUrls.indexOf(image);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ativeImageIndex == imageIndex
                        ? Colors.amber
                        : Colors.black12,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$${meal.price}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ta'rifi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(meal.description),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Card(
                margin: EdgeInsets.all(20),
                child: ListView.separated(
                    padding: EdgeInsets.all(20),
                    itemBuilder: (ctx, index) {
                      return Text(
                        meal.ingredients[index],
                        style: TextStyle(fontSize: 20),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: meal.ingredients.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
