import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_issue/issue_filter_model.g.dart';

@JsonSerializable()
class IssueFilterModel extends Equatable {
  final String? code;
  final String? name;

  const IssueFilterModel({
    this.code,
    this.name,
  });

  factory IssueFilterModel.fromJson(Map<String, dynamic> json) => _$IssueFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueFilterModelToJson(this);

  static List<IssueFilterModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueFilterModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
