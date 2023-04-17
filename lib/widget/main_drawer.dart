import 'package:flutter/material.dart';
import 'package:food/screen/tabs_screen.dart';
import '../screen/products_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(IconData icon, String title, Function() handle) {
    return ListTile(
      onTap: handle,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("Menu"),
          ),
          _buildMenuItem(Icons.home, "Bosh Sahifa", () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          _buildMenuItem(Icons.category, "Mahsulotlar", () {
            Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
