import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_action/issue_operation_list_model.g.dart';

@JsonSerializable()
class IssueOperationList extends Equatable {
  final bool? isPhoto;
  final bool? isTakeOver;
  final bool? isActivity;
  final bool? isChangeCfg;
  final bool? isSparepart;
  final bool? isPlannedCancel;

  const IssueOperationList({
    this.isPhoto,
    this.isTakeOver,
    this.isActivity,
    this.isChangeCfg,
    this.isSparepart,
    this.isPlannedCancel,
  });

  factory IssueOperationList.fromJson(Map<String, dynamic> json) => _$IssueOperationListFromJson(json);

  Map<String, dynamic> toJson() => _$IssueOperationListToJson(this);

  @override
  List<Object?> get props => [
        isPhoto,
        isTakeOver,
        isActivity,
        isChangeCfg,
        isSparepart,
        isPlannedCancel,
      ];
}
