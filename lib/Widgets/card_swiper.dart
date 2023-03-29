import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:recepies_app/Models/models.dart';

import '../Providers/coffee_provider.dart';

class CardSwiper extends StatelessWidget {
  final List<CoffeeResult> coffeeDrinks;

  const CardSwiper({super.key, required this.coffeeDrinks});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (coffeeDrinks.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.6,
      child: Swiper(
        itemCount: coffeeDrinks.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: (context, index) {
          final coffee = coffeeDrinks[index];

          return GestureDetector(
            onTap: () async {
              final CoffeeProvider coffeeProvider = CoffeeProvider();
              coffeeProvider.onDisplayCoffee =
                  await coffeeProvider.api.getCoffeeDrinkById(index + 1);
              CoffeeResult? coffeeDrink = coffeeProvider.onDisplayCoffee;
              Navigator.pushNamed(context, 'recipes', arguments: coffeeDrink);
            },
            child: Hero(
              tag: coffee.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  // ignore: unnecessary_string_interpolations
                  image: AssetImage("${coffee.imgUrl}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
