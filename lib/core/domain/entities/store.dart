class Store {
  final String name;
  final String sector;
  final String city;
  final String location;
  final String image;
  final String description;
  final String address;
  final String phone;
  final String email;
  final List<String> products;
  final String id;
  final String ownerId;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  const Store({
    required this.name,
    required this.sector,
    required this.city,
    required this.location,
    required this.image,
    required this.description,
    required this.address,
    required this.phone,
    required this.email,
    required this.products,
    required this.id,
    required this.ownerId,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });
}
