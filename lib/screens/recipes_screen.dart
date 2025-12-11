import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import '../widgets/recipe_item.dart';
import '../data/recipes.dart';

class RecipesScreen extends StatelessWidget {
  final void Function(int, String) onSelectRating;
  final Function() onSubmit;

  const RecipesScreen({
    super.key,
    required this.onSelectRating,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    Widget screen = ResultScreen(
      averageRating: averageRating,
      topRecipeName: topRecipeName,
      onRestart: onRestart,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ...recipes.asMap().entries.map((entry) {
              int index = entry.key;
              var recipe = entry.value;

              return RecipeItem(
                recipe: recipe,
                index: index,
                onSelectRating: onSelectRating,
              );
            }),
            ElevatedButton(
              onPressed: () => onSubmit(screen),
              child: Text("Submit"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
