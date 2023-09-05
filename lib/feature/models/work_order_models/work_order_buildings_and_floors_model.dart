import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_work_order/work_order_buildings_and_floors_model.g.dart';

@JsonSerializable()
class WorkOrderBuildingsAndFloorsModel extends Equatable {
  final String? code;
  final String? name;

  const WorkOrderBuildingsAndFloorsModel({
    this.code,
    this.name,
  });

  factory WorkOrderBuildingsAndFloorsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderBuildingsAndFloorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderBuildingsAndFloorsModelToJson(this);

  static List<WorkOrderBuildingsAndFloorsModel> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderBuildingsAndFloorsModel> items = [];
    for (var json in jsonList) {
      items.add(WorkOrderBuildingsAndFloorsModel.fromJson(json));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
