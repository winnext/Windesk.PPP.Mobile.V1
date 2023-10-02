import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_action/issue_available_activities_model.g.dart';

@JsonSerializable()
class IssueAvailableActivities extends Equatable {
    final String? activityid;
    final String? code;
    final String? acttypecode;
    final String? name;
    final String? fileattach;
    final dynamic additionaltime;
    final dynamic assigneeccType;
    final dynamic assigneeccOrg;
    final dynamic assigneeccUser;
    final dynamic description;
    final String? status;
    final dynamic asggroup;
    final dynamic asggroupname;
    final String? statusname;
    final String? minDescLength;
    final String? mobilePhoto;
    final String? barcodeSpace;
    final String? barcodeCfg;
    final String? additionaltimeInput;

  const IssueAvailableActivities({
        this.activityid,
        this.code,
        this.acttypecode,
        this.name,
        this.fileattach,
        this.additionaltime,
        this.assigneeccType,
        this.assigneeccOrg,
        this.assigneeccUser,
        this.description,
        this.status,
        this.asggroup,
        this.asggroupname,
        this.statusname,
        this.minDescLength,
        this.mobilePhoto,
        this.barcodeSpace,
        this.barcodeCfg,
        this.additionaltimeInput,
  });

  factory IssueAvailableActivities.fromJson(Map<String, dynamic> json) => _$IssueAvailableActivitiesFromJson(json);

  Map<String, dynamic> toJson() => _$IssueAvailableActivitiesToJson(this);

  static List<IssueAvailableActivities> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueAvailableActivities.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        activityid,
        code,
        acttypecode,
        name,
        fileattach,
        additionaltime,
        assigneeccType,
        assigneeccOrg,
        assigneeccUser,
        description,
        status,
        asggroup,
        asggroupname,
        statusname,
        minDescLength,
        mobilePhoto,
        barcodeSpace,
        barcodeCfg,
        additionaltimeInput,];
}
