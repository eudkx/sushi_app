class Food {
  final String name;
  final String imagePath;
  final String rating;
  final double price;
  final List<String> ingredients;
  final String title;

  Food(
      {required this.name,
      required this.imagePath,
      required this.rating,
      required this.price,
      required this.ingredients,
      required this.title});

  String get _name => name;
  double get _price => price;
  String get _rating => rating;
  String get _imagePath => imagePath;
}
