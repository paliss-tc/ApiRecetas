import 'package:flutter/material.dart';

import '../Models/models.dart';
import '../Providers/coffee_provider.dart';

class CoffeeSlider extends StatelessWidget {
  final List<CoffeeResult> coffeeDrinks;

  const CoffeeSlider({super.key, required this.coffeeDrinks});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Descriptions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeDrinks.length,
              itemBuilder: (_, int index) {
                return _CoffeePoster(coffee: coffeeDrinks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CoffeePoster extends StatelessWidget {
  final CoffeeResult coffee;
  const _CoffeePoster({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final CoffeeProvider coffeeProvider = CoffeeProvider();
              coffeeProvider.onDisplayCoffee =
                  await coffeeProvider.api.getCoffeeDrinkByName(coffee.name);
              CoffeeResult? coffeeDrink = coffeeProvider.onDisplayCoffee;
              Navigator.pushNamed(context, 'details', arguments: coffeeDrink);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: AssetImage(coffee.imgUrl),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            coffee.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
