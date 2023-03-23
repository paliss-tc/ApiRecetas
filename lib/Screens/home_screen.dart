import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepies_app/Providers/coffee_drinks_provider.dart';
import 'package:recepies_app/Themes/app_theme.dart';
import 'package:recepies_app/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeDrinksProvider = Provider.of<CoffeeDrinksProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.pallete3,
      appBar: AppBar(
        title: const Text("Menú de Café"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search_off_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(coffeeDrinks: coffeeDrinksProvider.onDisplayCoffeeList),

            //Coffee slider
            CoffeeSlider(
              coffeeDrinks: coffeeDrinksProvider.onDisplayCoffeeList,
            ),
          ],
        ),
      ),
    );
  }
}
