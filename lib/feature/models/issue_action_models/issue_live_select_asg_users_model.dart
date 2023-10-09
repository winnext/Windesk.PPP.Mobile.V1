import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_action/issue_live_select_asg_users_model.g.dart';

@JsonSerializable()
class LiveSelectAsgUsersModel extends Equatable{
    final String? code;
    final String? fullname;

    const LiveSelectAsgUsersModel({
        required this.code,
        required this.fullname,
    });
  
  factory LiveSelectAsgUsersModel.fromJson(Map<String, dynamic> json) => _$LiveSelectAsgUsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveSelectAsgUsersModelToJson(this);

  static List<LiveSelectAsgUsersModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LiveSelectAsgUsersModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        code,
        fullname,];

}
