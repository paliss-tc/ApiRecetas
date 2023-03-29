import 'package:flutter/material.dart';
import 'package:recepies_app/Models/coffee_result.dart';
import 'package:recepies_app/Themes/app_theme.dart';

import '../Providers/providers.dart';

class CoffeeSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Coffee Drinks';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.coffee,
        color: AppTheme.pallete2,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final CoffeeProvider coffeeProvider = CoffeeProvider();
    return FutureBuilder(
      future: coffeeProvider.api.searchCoffeeDrinksByName(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<CoffeeResult>?> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final coffeDrinks = snapshot.data!;
        return ListView.builder(
          itemCount: coffeDrinks.length,
          itemBuilder: (_, int index) => _CoffeeItem(coffeDrinks[index]),
        );
      },
    );
  }
}

class _CoffeeItem extends StatelessWidget {
  final CoffeeResult coffeDrink;

  const _CoffeeItem(this.coffeDrink);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: coffeDrink.name,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: AssetImage(coffeDrink.imgUrl),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(coffeDrink.name),
      subtitle: Text(coffeDrink.cupSize ?? ""),
      onTap: () => Navigator.pushNamed(
        context,
        'recipes',
        arguments: coffeDrink,
      ),
    );
  }
}
