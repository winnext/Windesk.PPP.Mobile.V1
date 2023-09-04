import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_store_product_model.g.dart';

@JsonSerializable()
class WorkOrderStoreProductModel extends Equatable {
  final String? productdefcode;
  final String? name;
  final String? unitcode;

  const WorkOrderStoreProductModel({
    this.productdefcode,
    this.name,
    this.unitcode,
  });

  factory WorkOrderStoreProductModel.fromJson(Map<String, dynamic> json) => _$WorkOrderStoreProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderStoreProductModelToJson(this);

  static List<WorkOrderStoreProductModel> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderStoreProductModel> items = [];
    for (var item in jsonList) {
      items.add(WorkOrderStoreProductModel.fromJson(item));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        productdefcode,
        name,
        unitcode,
      ];
}
