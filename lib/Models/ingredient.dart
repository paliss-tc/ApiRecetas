class Ingredient {
  Ingredient({required this.name, required this.quantity}) {
    imgUrl = "assets/ingredient_images/$name.jpg";
  }

  final String name;
  final String quantity;
  late final String imgUrl;
}
