import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_list_model.g.dart';

@JsonSerializable()
class WorkOrderListModel extends Equatable {
  final String? id;
  final String? code;
  final String? modulecode;
  final String? service;
  final String? serviceName;
  final String? modulelocation;
  final String? name;
  final String? responsible;
  final String? statusname;
  final String? plannedEnddate;

  const WorkOrderListModel({
    this.id,
    this.code,
    this.modulecode,
    this.service,
    this.serviceName,
    this.modulelocation,
    this.name,
    this.responsible,
    this.statusname,
    this.plannedEnddate,
  });

  factory WorkOrderListModel.fromJson(Map<String, dynamic> json) => _$WorkOrderListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderListModelToJson(this);

  static List<WorkOrderListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkOrderListModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        code,
        modulecode,
        service,
        serviceName,
        modulelocation,
        name,
        responsible,
        statusname,
        plannedEnddate,
      ];
}
