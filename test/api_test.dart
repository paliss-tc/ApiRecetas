// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:recepies_app/Api/coffee_drinks_api.dart';
import 'package:recepies_app/Models/coffee_result.dart';

void main() {
  late final CoffeDrinkApi api;

  setUpAll(() => api = CoffeDrinkApi(
        baseUrl: 'https://the-coffee-api.p.rapidapi.com',
        apiKey: 'e91c1237c1msh2c9307488e85493p187c4ejsnf89fdefa266d',
      ));

  test('Get Coffee Drink by Id', () async {
    final CoffeeResult? coffee = await api.getCoffeeDrinkById(13);
  });

  test('Get Coffee Drink by Name', () async {
    final CoffeeResult? coffee =
        await api.getCoffeeDrinkByName('machiatto_latte');
  });

  test('Get all Coffee Drinks', () async {
    final List<CoffeeResult>? coffeeDrinks = await api.getAllCoffeeDrinks();
  });

  test('Search Coffee Drinks by Name', () async {
    final List<CoffeeResult>? coffee =
        await api.searchCoffeeDrinksByName('coffee');
  });
}
