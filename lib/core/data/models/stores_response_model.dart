import 'package:json_annotation/json_annotation.dart';
import 'store_model.dart';

part 'stores_response_model.g.dart';

@JsonSerializable()
class StoresResponseModel {
  final List<StoreModel> stores;
  final int total;
  final int page;
  final int limit;

  const StoresResponseModel({
    required this.stores,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory StoresResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoresResponseModelToJson(this);
}
