import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_tracing_list_model.g.dart';

@JsonSerializable()
class WorkOrderTracingListModel extends Equatable {
  final String? code;
  final String? name;
  final String? count;

  const WorkOrderTracingListModel({
    this.code,
    this.name,
    this.count,
  });

  factory WorkOrderTracingListModel.fromJson(Map<String, dynamic> json) => _$WorkOrderTracingListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderTracingListModelToJson(this);

  static List<WorkOrderTracingListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkOrderTracingListModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        name,
        count,
      ];
}
