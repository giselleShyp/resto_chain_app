class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String logoUrl;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
  });

  factory RestaurantModel.fromMap(String id, Map<String, dynamic> map) {
    return RestaurantModel(
      id: id,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'logoUrl': logoUrl,
    };
  }
}
