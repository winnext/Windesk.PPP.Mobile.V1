import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_store_product_package_info_model.g.dart';

@JsonSerializable()
class WorkOrderStoreProductPackageInfoModel extends Equatable {
  final String? code;
  final String? amount;
  final String? unitcode;

  const WorkOrderStoreProductPackageInfoModel({
    this.code,
    this.amount,
    this.unitcode,
  });

  factory WorkOrderStoreProductPackageInfoModel.fromJson(Map<String, dynamic> json) => _$WorkOrderStoreProductPackageInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderStoreProductPackageInfoModelToJson(this);

  static List<WorkOrderStoreProductPackageInfoModel> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderStoreProductPackageInfoModel> items = [];
    for (var item in jsonList) {
      items.add(WorkOrderStoreProductPackageInfoModel.fromJson(item));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        code,
        amount,
        unitcode,
      ];
}
