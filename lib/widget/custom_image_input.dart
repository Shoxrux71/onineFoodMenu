import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final TextEditingController imageControllerl;
  final String label;

  const CustomImageInput(
      {super.key, required this.imageControllerl, required this.label});

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  var image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          width: 100,
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(10),
          ),
          child: image != null && image.isNotEmpty
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Image.asset(
                  "assets/images/kartina.png",
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: widget.label,
            ),
            controller: widget.imageControllerl,
            onSubmitted: (value) {
              setState(() {
                image = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
