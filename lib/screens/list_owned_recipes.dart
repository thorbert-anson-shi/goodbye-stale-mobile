import 'package:flutter/material.dart';
import 'package:goodbye_stale_mobile/models/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListRecipes extends StatefulWidget {
  const ListRecipes({super.key});

  @override
  State<ListRecipes> createState() => _ListRecipesState();
}

class _ListRecipesState extends State<ListRecipes> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/json/'));
    if (response.statusCode == 200) {
      final List<dynamic> recipeJson = json.decode(response.body);
      setState(() {
        _recipes = recipeJson.map((json) => Recipe.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: _recipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.fields.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(recipe.fields.description),
                      const SizedBox(height: 10),
                      Text('Ingredients: ${recipe.fields.ingredients}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
