class CategoryModel {
  String title;
  String assetPath;
  CategoryModel({
    required this.title,
    required this.assetPath,
  });
}

List<CategoryModel> categories = [
  CategoryModel(title: 'Home', assetPath: 'house.png'),
  CategoryModel(title: 'Office', assetPath: 'house.png'),
  CategoryModel(title: 'Apartment', assetPath: 'house.png'),
  CategoryModel(title: 'Flat', assetPath: 'house.png'),
];
