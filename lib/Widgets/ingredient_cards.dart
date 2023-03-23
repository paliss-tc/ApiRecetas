import 'package:flutter/material.dart';
import '../Models/models.dart';

class IngredientCards extends StatelessWidget {
  final CoffeeResult coffee;
  const IngredientCards({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    if (coffee.recipe != null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          itemCount: coffee.recipe!.ingredients.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((_, index) =>
              _IngredientCard(ingredient: coffee.recipe!.ingredients[index])),
        ),
      );
    }
    return Container();
  }
}

class _IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  const _IngredientCard({required this.ingredient});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: AssetImage(ingredient.imgUrl),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            ingredient.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            ingredient.quantity,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
