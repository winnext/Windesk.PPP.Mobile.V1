import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_action/issue_live_select_asg_groups_model.g.dart';

@JsonSerializable()
class LiveSelectAsgGroupsModel extends Equatable{
    final String? code;
    final String? name;

    const LiveSelectAsgGroupsModel({
        required this.code,
        required this.name,
    });
  
  factory LiveSelectAsgGroupsModel.fromJson(Map<String, dynamic> json) => _$LiveSelectAsgGroupsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveSelectAsgGroupsModelToJson(this);

  static List<LiveSelectAsgGroupsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LiveSelectAsgGroupsModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        name,];

}
