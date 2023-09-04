import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_issue/issue_summary_model.g.dart';

@JsonSerializable()
class IssueSummaryModel extends Equatable {
  final String? id;
  final String? code;
  final String? relatedcode;
  final String? sumdesc1;
  final String? title;
  final String? cat1;
  final String? statuscode;
  final String? statusname;
  final String? contactcode;
  final String? contactname;
  final String? assignmentgroup;
  final String? assignmentgroupname;
  final String? assigneecontactcode;
  final String? assigneename;
  final String? idate;
  final dynamic planneddate;
  final dynamic planneddesc;
  final String? locname;
  final String? loctree;
  final String? description;
  final String? slacode;
  final String? ani;
  final dynamic cmdb;
  final String? targetFdate;
  final String? targetRdate;
  final String? parentstatus;
  final String? hys;
  final String? hds;
  final String? wrongredirect;

  const IssueSummaryModel({
    this.id,
    this.code,
    this.relatedcode,
    this.sumdesc1,
    this.title,
    this.cat1,
    this.statuscode,
    this.statusname,
    this.contactcode,
    this.contactname,
    this.assignmentgroup,
    this.assignmentgroupname,
    this.assigneecontactcode,
    this.assigneename,
    this.idate,
    this.planneddate,
    this.planneddesc,
    this.locname,
    this.loctree,
    this.description,
    this.slacode,
    this.ani,
    this.cmdb,
    this.targetFdate,
    this.targetRdate,
    this.parentstatus,
    this.hys,
    this.hds,
    this.wrongredirect,
  });

  factory IssueSummaryModel.fromJson(Map<String, dynamic> json) => _$IssueSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueSummaryModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        code,
        relatedcode,
        sumdesc1,
        title,
        cat1,
        statuscode,
        statusname,
        contactcode,
        contactname,
        assignmentgroup,
        assignmentgroupname,
        assigneecontactcode,
        assigneename,
        idate,
        planneddate,
        planneddesc,
        locname,
        loctree,
        description,
        slacode,
        ani,
        cmdb,
        targetFdate,
        targetRdate,
        parentstatus,
        hys,
        hds,
        wrongredirect,
      ];
}
