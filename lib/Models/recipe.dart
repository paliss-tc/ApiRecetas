import 'package:recepies_app/Models/models.dart';

class Recipe {
  Recipe(
      {required this.ingredients,
      required this.instructions,
      this.recipeYield});

  final List<Ingredient> ingredients;
  final List<String> instructions;
  final String? recipeYield;
}
