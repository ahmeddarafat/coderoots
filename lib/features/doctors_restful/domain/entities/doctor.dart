class Doctor{
  final String name;
  final String email;
  final String mobile;
  final String address;
  final Category category;
  final double price;
  final String biography;
  final String cities;

  Doctor({
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.category,
    required this.price,
    required this.biography,
    required this.cities,
  });
}

class Category {
  final String name;

  Category({required this.name});
}