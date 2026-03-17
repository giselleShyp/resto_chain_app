class MenuItemModel {
  final String id;
  final String branchId;
  final String restaurantId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isAvailable;

  const MenuItemModel({
    required this.id,
    required this.branchId,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
  });

  factory MenuItemModel.fromMap(String id, Map<String, dynamic> data) {
    return MenuItemModel(
      id: id,
      branchId: data['branchId'] ?? '',
      restaurantId: data['restaurantId'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] as num).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      isAvailable: data['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'branchId': branchId,
      'restaurantId': restaurantId,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
    };
  }
}
