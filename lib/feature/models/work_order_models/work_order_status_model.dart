import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_work_order/work_order_status_model.g.dart';

@JsonSerializable()
class WorkOrderStatusModel extends Equatable {
  final String? dispvalue;
  final String? realvalue;

  const WorkOrderStatusModel({
    this.dispvalue,
    this.realvalue,
  });

  factory WorkOrderStatusModel.fromJson(Map<String, dynamic> json) => _$WorkOrderStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderStatusModelToJson(this);

  static List<WorkOrderStatusModel> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderStatusModel> items = [];
    for (var json in jsonList) {
      items.add(WorkOrderStatusModel.fromJson(json));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        dispvalue,
        realvalue,
      ];
}
