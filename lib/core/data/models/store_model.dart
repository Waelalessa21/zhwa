import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
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
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const StoreModel({
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

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
