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

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
