import 'package:flutter/material.dart';
import 'package:recepies_app/Models/coffee_result.dart';
import '../Api/coffee_drinks_api.dart';

class CoffeeDrinksProvider extends ChangeNotifier {
  List<CoffeeResult> onDisplayCoffeeList = List.empty();
  final CoffeDrinkApi api = CoffeDrinkApi(
      baseUrl: 'https://the-coffee-api.p.rapidapi.com',
      // apiKey: 'e91c1237c1msh2c9307488e85493p187c4ejsnf89fdefa266d'
      apiKey: '556adc7937mshe49ff6747a44e12p19818bjsna1de7d06d378');

  CoffeeDrinksProvider() {
    // ignore: avoid_print
    print('coffee provider inicializado');
    getOnDisplayCoffeeDrinks();
  }

  getOnDisplayCoffeeDrinks() async {
    onDisplayCoffeeList = (await api.getAllCoffeeDrinks())!;
    notifyListeners();
  }

  searchCoffeeDrinksByName(String coffeeName) async {
    onDisplayCoffeeList = (await api.searchCoffeeDrinksByName(coffeeName))!;
    notifyListeners();
  }
}
