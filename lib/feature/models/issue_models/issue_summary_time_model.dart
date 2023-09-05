import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue_summary_time_model.g.dart';

@JsonSerializable()
class IssueSummaryTimeModel extends Equatable {
  final String? code;
  final String? targetFdate;
  final String? targetRdate;
  final String? statuscode;
  final String? respondedDate;
  final String? respondedTimer;
  final String? fixedDate;
  final String? fixTimer;
  final dynamic planneddate;

  const IssueSummaryTimeModel({
    this.code,
    this.respondedDate,
    this.respondedTimer,
    this.fixedDate,
    this.fixTimer,
    this.statuscode,
    this.planneddate,
    this.targetFdate,
    this.targetRdate,
  });

  factory IssueSummaryTimeModel.fromJson(Map<String, dynamic> json) => _$IssueSummaryTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueSummaryTimeModelToJson(this);

  @override
  List<Object?> get props => [
        code,
        respondedDate,
        respondedTimer,
        fixedDate,
        fixTimer,
        statuscode,
        planneddate,
        targetFdate,
        targetRdate,
      ];
}
