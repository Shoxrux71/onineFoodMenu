import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widget/custom_image_input.dart';
import '../models/meal.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addFunction;

  const AddNewProductScreen(
      {super.key, required this.categories, required this.addFunction});
  static const routeName = '/add-new=product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categoryId;
  final _titleController = TextEditingController();
  final _describtionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();

  @override
  void initState() {
    categoryId = widget.categories[0].id;
  }

  void _save(BuildContext context) {
    final title = _titleController.text;
    final desc = _describtionController.text;
    final ingred = _ingredientsController.text;
    final price = _priceController.text;
    final pretTime = _preparingTimeController.text;
    final mainImage = _mainImageController.text;
    final firtsImage = _firstImageController.text;
    final secondImage = _secondImageController.text;

    if (title.isEmpty ||
        desc.isEmpty ||
        ingred.isEmpty ||
        price.isEmpty ||
        pretTime.isEmpty ||
        mainImage.isEmpty ||
        firtsImage.isEmpty ||
        secondImage.isEmpty) {
      return;
    }
    final List<String> ingreds = ingred.split(",");
    final List<String> imageUrls = [
      mainImage,
      firtsImage,
      secondImage,
    ];
    widget.addFunction(
      Meal(
          id: UniqueKey().toString(),
          title: title,
          imageUrls: imageUrls,
          description: desc,
          prepairingTime: int.parse(pretTime),
          price: double.parse(price),
          categoryId: categoryId,
          ingredients: ingreds),
    );

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ovqat qo'shish"),
        actions: [
          IconButton(
            onPressed: () {
              _save(context);
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        alignment: Alignment.center,
                        child: Text(
                          category.title,
                          style: TextStyle(fontSize: 22),
                        ),
                        value: category.id,
                      ),
                    )
                    .toList(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom Nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom Tarifi",
                ),
                controller: _describtionController,
                maxLines: 4,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom Tarkibi (Misol uchu: Go'sht,Pamidor,Sir)",
                ),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Taom Narxi",
                ),
                controller: _priceController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Tayyorlanish Vaqti (minut)",
                ),
                controller: _preparingTimeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomImageInput(
                imageControllerl: _mainImageController,
                label: 'Surat link ni kiriting',
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageControllerl: _firstImageController,
                label: 'Yana Surat link ni kiriting 1',
              ),
              const SizedBox(height: 15),
              CustomImageInput(
                imageControllerl: _secondImageController,
                label: 'Yana Surat link ni kiriting 2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
