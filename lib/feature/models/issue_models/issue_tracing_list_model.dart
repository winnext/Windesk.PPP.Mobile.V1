import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part './generator_issue/issue_tracing_list_model.g.dart';

@JsonSerializable()
class IssueTracingListModel extends Equatable {
  final String? name;
  final String? code;
  final dynamic count;

  const IssueTracingListModel({
    this.name,
    this.code,
    this.count,
  });

  factory IssueTracingListModel.fromJson(Map<String, dynamic> json) => _$IssueTracingListModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueTracingListModelToJson(this);

  static List<IssueTracingListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueTracingListModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        name,
        code,
        count,
      ];
}
