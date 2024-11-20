// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  String model;
  String pk;
  Fields fields;

  Recipe({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  int price;
  String description;
  Ingredients ingredients;
  String category;
  int creator;

  Fields({
    required this.name,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.category,
    required this.creator,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        ingredients: Ingredients.fromJson(json["ingredients"]),
        category: json["category"],
        creator: json["creator"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "ingredients": ingredients.toJson(),
        "category": category,
        "creator": creator,
      };
}

class Ingredients {
  String ingredient;

  Ingredients({
    required this.ingredient,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        ingredient: json["ingredient"],
      );

  Map<String, dynamic> toJson() => {
        "ingredient": ingredient,
      };
}
