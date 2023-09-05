import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_issue/issue_activities_model.g.dart';

@JsonSerializable()
class IssueActivitiesModel extends Equatable {
  final String? id;
  final String? name;
  final String? idate;
  final String? description;
  final String? iuser;
  final String? iusername;
  final dynamic additionaltime;

  const IssueActivitiesModel({
    this.id,
    this.name,
    this.idate,
    this.description,
    this.iuser,
    this.iusername,
    this.additionaltime,
  });
  factory IssueActivitiesModel.fromJson(Map<String, dynamic> json) => _$IssueActivitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueActivitiesModelToJson(this);

  static List<IssueActivitiesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueActivitiesModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [id, name, idate, description, iuser, iusername, additionaltime];
}
