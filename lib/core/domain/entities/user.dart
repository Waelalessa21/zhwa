class User {
  final String username;
  final String type;
  final String id;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  const User({
    required this.username,
    required this.type,
    required this.id,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });
}
