import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen";
  int index = 0;

  // selectedRatings is initially filled with empty strings because the rating is not yet given.
  List<String> selectedRatings = List.filled(recipes.length, "");

  String topRecipeName() {
    int bestValue = -1;
    String bestName = "";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > bestValue) {
          bestValue = value;
          bestName = recipes[i].recipeName;
        }
      }
    }
    return bestName;
  }

  void _submit() {
    setState(() {
      currentScreen = 'ResultScreen';
    });
  }

  void _selectingRating(int index, String rating) {}

  void averageRating() {
    setState(() {});
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
    if (selectedRatings.isNotEmpty) {
      screenWidget = RecipesScreen(
        onSelectRating: _selectingRating,
        onSubmit: _submit,
      );
    }

    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
