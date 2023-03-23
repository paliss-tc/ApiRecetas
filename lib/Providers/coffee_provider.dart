import 'package:flutter/material.dart';
import 'package:recepies_app/Models/coffee_result.dart';
import '../Api/coffee_drinks_api.dart';

class CoffeeProvider extends ChangeNotifier {
  CoffeeResult? onDisplayCoffee;
  final CoffeDrinkApi api = CoffeDrinkApi(
      baseUrl: 'https://the-coffee-api.p.rapidapi.com',
      apiKey: '556adc7937mshe49ff6747a44e12p19818bjsna1de7d06d378');

  // CoffeeProvider.fromCoffeeId(int coffeeId) {
  //   print('coffee provider inicializado');
  //   //getOnDisplayCoffeeDrinkById(coffeeId);
  // }

  // CoffeeProvider.fromCoffeeName(String coffeeName) {
  //   print('coffee provider inicializado');
  //   // getOnDisplayCoffeeDrinkByName(coffeeName);
  // }

  CoffeeProvider() {
    // ignore: avoid_print
    print('coffee provider inicializado');
  }

  getOnDisplayCoffeeDrinkById(int coffeeId) async {
    onDisplayCoffee = await api.getCoffeeDrinkById(coffeeId);
    notifyListeners();
  }

  getOnDisplayCoffeeDrinkByName(String coffeeName) async {
    onDisplayCoffee = await api.getCoffeeDrinkByName(coffeeName);
    notifyListeners();
  }
}
