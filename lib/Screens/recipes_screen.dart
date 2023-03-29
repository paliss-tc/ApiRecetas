import 'package:flutter/material.dart';
import 'package:recepies_app/Models/models.dart';
import 'package:recepies_app/Themes/app_theme.dart';
import 'package:recepies_app/Widgets/widgets.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

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
                _PictureAndName(
                  coffee: coffee,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17, top: 8),
                  child: Text(
                    'Steps:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _RecipeSteps(instructions: coffee.recipe!.instructions),
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

class _RecipeSteps extends StatelessWidget {
  final List<String> instructions;

  const _RecipeSteps({required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: instructions.length * 30,
        child: ListView.separated(
          itemCount: instructions.length,
          itemBuilder: (_, index) =>
              Text('Step ${index + 1}: ${instructions[index]}'),
          separatorBuilder: (_, index) => const SizedBox(
            height: 10,
          ),
        ),
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
      expandedHeight: 200,
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

class _PictureAndName extends StatelessWidget {
  final CoffeeResult coffee;

  const _PictureAndName({required this.coffee});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: coffee.name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: AssetImage(coffee.imgUrl),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.name,
                // ignore: deprecated_member_use
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Container(
                child: coffee.hasAlcohol == true
                    ? Row(
                        children: [
                          const Icon(
                            Icons.wine_bar,
                            size: 15,
                            color: AppTheme.pallete4,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Alcoholic Drink',
                            // ignore: deprecated_member_use
                            style: textTheme.subtitle1,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      )
                    : Text(
                        'No Alcohol',
                        // ignore: deprecated_member_use
                        style: textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.brightness_1_outlined,
                    size: 10,
                    color: AppTheme.pallete4,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${coffee.cupSize?.toUpperCase()}",
                    // ignore: deprecated_member_use
                    style: textTheme.subtitle2,
                  ),
                ],
              ),
            ],
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        coffee.description,
        textAlign: TextAlign.justify,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
