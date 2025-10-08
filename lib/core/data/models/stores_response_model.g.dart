// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoresResponseModel _$StoresResponseModelFromJson(Map<String, dynamic> json) =>
    StoresResponseModel(
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$StoresResponseModelToJson(
  StoresResponseModel instance,
) => <String, dynamic>{
  'stores': instance.stores,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
};
