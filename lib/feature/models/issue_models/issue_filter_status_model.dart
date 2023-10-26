import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_issue/issue_filter_status_model.g.dart';

@JsonSerializable()
class IssueFilterStatusModel extends Equatable {
  final String? code;
  final String? name;

  const IssueFilterStatusModel({
    this.code,
    this.name,
  });

  factory IssueFilterStatusModel.fromJson(Map<String, dynamic> json) => _$IssueFilterStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueFilterStatusModelToJson(this);

  static List<IssueFilterStatusModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueFilterStatusModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
