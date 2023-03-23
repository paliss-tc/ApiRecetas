import 'package:recepies_app/Models/models.dart';

class CoffeeResult {
  CoffeeResult(
      {required this.name,
      required this.description,
      this.hasAlcohol,
      this.cupSize,
      this.recipe}) {
    imgUrl = "assets/coffee_images/$name.jpg";
  }

  final String name;
  final String description;
  final bool? hasAlcohol;
  final String? cupSize;
  final Recipe? recipe;
  late final String imgUrl;
}
