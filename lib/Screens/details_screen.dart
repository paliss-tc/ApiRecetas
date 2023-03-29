import 'package:flutter/material.dart';
import 'package:recepies_app/Models/models.dart';
import 'package:recepies_app/Themes/app_theme.dart';
import 'package:recepies_app/Widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CoffeeResult coffee =
        ModalRoute.of(context)!.settings.arguments as CoffeeResult;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            coffeeImgUrl: coffee.imgUrl,
            coffeeName: coffee.name,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.only(left: 17, bottom: 8, top: 8),
                  child: Text(
                    'Description:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _Overview(
                  coffee: coffee,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17, bottom: 8, top: 8),
                  child: Text(
                    'Ingredients:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                IngredientCards(
                  coffee: coffee,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String coffeeName;
  final String coffeeImgUrl;

  const _CustomAppBar({required this.coffeeName, required this.coffeeImgUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.pallete1,
      expandedHeight: 700,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            coffeeName,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: AssetImage(coffeeImgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final CoffeeResult coffee;

  const _Overview({required this.coffee});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Text(
        coffee.description,
        textAlign: TextAlign.justify,
        maxLines: 10,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
