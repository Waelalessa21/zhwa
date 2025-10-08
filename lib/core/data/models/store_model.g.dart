// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
  name: json['name'] as String,
  sector: json['sector'] as String,
  city: json['city'] as String,
  location: json['location'] as String,
  image: json['image'] as String,
  description: json['description'] as String,
  address: json['address'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  products: (json['products'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  id: json['id'] as String,
  ownerId: json['owner_id'] as String,
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sector': instance.sector,
      'city': instance.city,
      'location': instance.location,
      'image': instance.image,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'products': instance.products,
      'id': instance.id,
      'owner_id': instance.ownerId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
