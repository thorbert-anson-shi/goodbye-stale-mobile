import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class NewRecipeForm extends StatefulWidget {
  const NewRecipeForm({super.key});

  @override
  NewRecipeFormState createState() => NewRecipeFormState();
}

class NewRecipeFormState extends State<NewRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _ingredients = "";
  String _category = "";

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 4 || value.length > 40) {
      return 'Name must be between 4 and 20 characters';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Price must be greater than zero';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a description";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Recipe Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      icon: Icon(Icons.fastfood)),
                  validator: _validateName,
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price',
                      icon: Icon(Icons.attach_money)),
                  keyboardType: TextInputType.number,
                  validator: _validatePrice,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    icon: Icon(Icons.description)),
                validator: _validateDescription,
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients',
                    icon: Icon(Icons.list)),
                onChanged: (String? value) {
                  setState(() {
                    _ingredients = value!;
                  });
                },
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category',
                    icon: Icon(Icons.category)),
                onChanged: (String? value) {
                  setState(() {
                    _category = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                            'http://127.0.0.1:8000/create_product_ajax/',
                            jsonEncode(
                              {
                                'name': _name,
                                'price': int.parse(_price.toString()),
                                'description': _description,
                                'ingredients': _ingredients,
                                'category': _category,
                              },
                            ));
                        if (response['status'] == true) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Recipe saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Exit from dialog
                                      Navigator.pop(context); // Exit form page
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: Text(
                                    response['message'] ?? 'An error occurred'),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Recipe saved!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context); // Exit from dialog
                                    Navigator.pop(context); // Exit form page
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
