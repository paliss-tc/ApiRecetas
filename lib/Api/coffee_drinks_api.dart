import 'package:dio/dio.dart';
import 'package:recepies_app/Models/models.dart';

class CoffeDrinkApi {
  CoffeDrinkApi({
    required this.baseUrl,
    required this.apiKey,
    this.rapidApiHost = 'the-coffee-api.p.rapidapi.com',
    this.connectTimeout = const Duration(seconds: 5),
    this.receiveTimeout = const Duration(seconds: 5),
  }) : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': rapidApiHost,
          },
        ));

  final Dio dio;
  final String baseUrl;
  final String rapidApiHost;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String apiKey;

  Future<List<CoffeeResult>?> getAllCoffeeDrinks() async {
    final response = await dio.get<List<dynamic>>('/drinks');

    final currentCoffeeDrinks = response.data;
    if (currentCoffeeDrinks == null) return null;
    List<CoffeeResult> coffeeDrinks = <CoffeeResult>[];
    for (Map<String, dynamic> currentCoffee in currentCoffeeDrinks) {
      if (!currentCoffee.containsKey('name') ||
          !currentCoffee.containsKey('description')) return null;
      String coffeeName = currentCoffee['name'];
      String coffeeDescription = currentCoffee['description'];

      final CoffeeResult coffee =
          CoffeeResult(name: coffeeName, description: coffeeDescription);
      coffeeDrinks.add(coffee);
    }
    return coffeeDrinks;
  }

  Future<List<CoffeeResult>?> searchCoffeeDrinksByName(
      String coffeeName) async {
    final response = await dio.get<List<dynamic>>('/drinks/$coffeeName',
        queryParameters: {'keys': 'description,hasAlcohol,cupSize,recipe'});

    final currentCoffeeDrinks = response.data;
    if (currentCoffeeDrinks == null) return null;
    List<CoffeeResult> coffeeDrinks = <CoffeeResult>[];
    for (Map<String, dynamic> currentCoffee in currentCoffeeDrinks) {
      if (!currentCoffee.containsKey('description') ||
          !currentCoffee.containsKey('hasAlcohol') ||
          !currentCoffee.containsKey('cupSize') ||
          !currentCoffee.containsKey('recipe')) return null;

      String coffeeDescription = currentCoffee['description'];
      bool coffeeHasAlcohol = currentCoffee['hasAlcohol'];
      String coffeeCupSize = currentCoffee['cupSize'];
      Map<String, dynamic> currentRecipe = currentCoffee['recipe'];
      if (!currentRecipe.containsKey('ingredients') ||
          !currentRecipe.containsKey('instructions') ||
          !currentRecipe.containsKey('yield')) return null;
      List<dynamic> currentRecipeIngredients = currentRecipe['ingredients'];
      List<Ingredient> recipeIngredients = <Ingredient>[];
      for (var currentIngredient in currentRecipeIngredients) {
        if (!currentIngredient.containsKey('name') ||
            !currentIngredient.containsKey('quantity')) return null;
        String currentIngredientName = currentIngredient['name'];
        String currentIngredientquantity = currentIngredient['quantity'];

        Ingredient ingredient = Ingredient(
            name: currentIngredientName, quantity: currentIngredientquantity);
        recipeIngredients.add(ingredient);
      }
      List<dynamic> dynamicRecipeInstructions = currentRecipe['instructions'];
      List<String> recipeInstructions =
          dynamicRecipeInstructions.map((e) => e.toString()).toList();

      String? recipeYield = currentRecipe['yield'];

      Recipe coffeeRecipe = Recipe(
        ingredients: recipeIngredients,
        instructions: recipeInstructions,
        recipeYield: recipeYield,
      );

      final CoffeeResult coffee = CoffeeResult(
        name: coffeeName,
        description: coffeeDescription,
        cupSize: coffeeCupSize,
        hasAlcohol: coffeeHasAlcohol,
        recipe: coffeeRecipe,
      );
      coffeeDrinks.add(coffee);
    }
    return coffeeDrinks;
  }

  Future<CoffeeResult?> getCoffeeDrinkById(int coffeeId) async {
    final response = await dio.get<Map<String, dynamic>>(
        '/drinks/unique/id/$coffeeId',
        queryParameters: {'keys': 'description,hasAlcohol,cupSize,recipe'});

    final currentCoffee = response.data;
    if (currentCoffee == null) return null;
    if (!currentCoffee.containsKey('name') ||
        !currentCoffee.containsKey('description') ||
        !currentCoffee.containsKey('hasAlcohol') ||
        !currentCoffee.containsKey('cupSize') ||
        !currentCoffee.containsKey('recipe')) return null;

    String coffeeName = currentCoffee['name'];
    String coffeeDescription = currentCoffee['description'];
    bool coffeeHasAlcohol = currentCoffee['hasAlcohol'];
    String coffeeCupSize = currentCoffee['cupSize'];
    Map<String, dynamic> currentRecipe = currentCoffee['recipe'];
    if (!currentRecipe.containsKey('ingredients') ||
        !currentRecipe.containsKey('instructions') ||
        !currentRecipe.containsKey('yield')) return null;
    List<dynamic> currentRecipeIngredients = currentRecipe['ingredients'];
    List<Ingredient> recipeIngredients = <Ingredient>[];
    for (var currentIngredient in currentRecipeIngredients) {
      if (!currentIngredient.containsKey('name') ||
          !currentIngredient.containsKey('quantity')) return null;
      String currentIngredientName = currentIngredient['name'];
      String currentIngredientquantity = currentIngredient['quantity'];

      Ingredient ingredient = Ingredient(
          name: currentIngredientName, quantity: currentIngredientquantity);
      recipeIngredients.add(ingredient);
    }
    List<dynamic> dynamicRecipeInstructions = currentRecipe['instructions'];
    List<String> recipeInstructions =
        dynamicRecipeInstructions.map((e) => e.toString()).toList();

    String? recipeYield = currentRecipe['yield'];

    Recipe coffeeRecipe = Recipe(
      ingredients: recipeIngredients,
      instructions: recipeInstructions,
      recipeYield: recipeYield,
    );

    final CoffeeResult coffee = CoffeeResult(
      name: coffeeName,
      description: coffeeDescription,
      cupSize: coffeeCupSize,
      hasAlcohol: coffeeHasAlcohol,
      recipe: coffeeRecipe,
    );
    return coffee;
  }

  Future<CoffeeResult?> getCoffeeDrinkByName(String coffeeName) async {
    final response = await dio.get<Map<String, dynamic>>(
        '/drinks/unique/name/$coffeeName',
        queryParameters: {'keys': 'description,hasAlcohol,cupSize,recipe'});

    final currentCoffee = response.data;
    if (currentCoffee == null) return null;
    if (!currentCoffee.containsKey('description') ||
        !currentCoffee.containsKey('hasAlcohol') ||
        !currentCoffee.containsKey('cupSize') ||
        !currentCoffee.containsKey('recipe')) return null;

    String coffeeDescription = currentCoffee['description'];
    bool coffeeHasAlcohol = currentCoffee['hasAlcohol'];
    String coffeeCupSize = currentCoffee['cupSize'];
    Map<String, dynamic> currentRecipe = currentCoffee['recipe'];
    if (!currentRecipe.containsKey('ingredients') ||
        !currentRecipe.containsKey('instructions') ||
        !currentRecipe.containsKey('yield')) return null;
    List<dynamic> currentRecipeIngredients = currentRecipe['ingredients'];
    List<Ingredient> recipeIngredients = <Ingredient>[];
    for (var currentIngredient in currentRecipeIngredients) {
      if (!currentIngredient.containsKey('name') ||
          !currentIngredient.containsKey('quantity')) return null;
      String currentIngredientName = currentIngredient['name'];
      String currentIngredientquantity = currentIngredient['quantity'];

      Ingredient ingredient = Ingredient(
          name: currentIngredientName, quantity: currentIngredientquantity);
      recipeIngredients.add(ingredient);
    }
    List<dynamic> dynamicRecipeInstructions = currentRecipe['instructions'];
    List<String> recipeInstructions =
        dynamicRecipeInstructions.map((e) => e.toString()).toList();

    String? recipeYield = currentRecipe['yield'];

    Recipe coffeeRecipe = Recipe(
      ingredients: recipeIngredients,
      instructions: recipeInstructions,
      recipeYield: recipeYield,
    );

    final CoffeeResult coffee = CoffeeResult(
      name: coffeeName,
      description: coffeeDescription,
      cupSize: coffeeCupSize,
      hasAlcohol: coffeeHasAlcohol,
      recipe: coffeeRecipe,
    );
    return coffee;
  }
}
