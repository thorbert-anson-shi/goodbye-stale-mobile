import 'package:flutter/material.dart';
import 'package:goodbye_stale_mobile/screens/home.dart';
import 'package:goodbye_stale_mobile/screens/new_recipe_form.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Add Recipe'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewRecipeForm()));
            },
          ),
        ],
      ),
    );
  }
}
