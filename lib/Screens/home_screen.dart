import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepies_app/Providers/coffee_drinks_provider.dart';
import 'package:recepies_app/Themes/app_theme.dart';
import 'package:recepies_app/Widgets/widgets.dart';
import 'package:recepies_app/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeDrinksProvider = Provider.of<CoffeeDrinksProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.pallete3,
      appBar: AppBar(
        title: const Text("Coffee Drinks Receipes"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CoffeeSearchDelegate()),
            icon: const Icon(Icons.search_outlined),
          )
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
