// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueSummaryModel _$IssueSummaryModelFromJson(Map<String, dynamic> json) => IssueSummaryModel(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      relatedcode: json['RELATEDCODE'] as String?,
      sumdesc1: json['SUMDESC1'] as String?,
      title: json['TITLE'] as String?,
      cat1: json['CAT1'] as String?,
      statuscode: json['STATUSCODE'] as String?,
      statusname: json['STATUSNAME'] as String?,
      contactcode: json['CONTACTCODE'] as String?,
      contactname: json['CONTACTNAME'] as String?,
      assignmentgroup: json['ASSIGNMENTGROUP'] as String?,
      assignmentgroupname: json['ASSIGNMENTGROUPNAME'] as String?,
      assigneecontactcode: json['ASSIGNEECONTACTCODE'],
      assigneename: json['ASSIGNEENAME'],
      idate: json['IDATE'] as String?,
      planneddate: json['PLANNEDDATE'],
      planneddesc: json['PLANNEDDESC'],
      locname: json['LOCNAME'] as String?,
      loctree: json['LOCTREE'] as String?,
      description: json['DESCRIPTION'] as String?,
      slacode: json['SLACODE'] as String?,
      ani: json['ANI'] as String?,
      cmdb: json['CMDB'],
      targetFdate: json['TARGET_FDATE'] as String?,
      targetRdate: json['TARGET_RDATE'] as String?,
      parentstatus: json['PARENTSTATUS'] as String?,
      hys: json['HYS'] as String?,
      hds: json['HDS'] as String?,
      wrongredirect: json['WRONGREDIRECT'] as String?,
    );

Map<String, dynamic> _$IssueSummaryModelToJson(IssueSummaryModel instance) => <String, dynamic>{
      'ID': instance.id,
      'CODE': instance.code,
      'RELATEDCODE': instance.relatedcode,
      'SUMDESC1': instance.sumdesc1,
      'TITLE': instance.title,
      'CAT1': instance.cat1,
      'STATUSCODE': instance.statuscode,
      'STATUSNAME': instance.statusname,
      'CONTACTCODE': instance.contactcode,
      'CONTACTNAME': instance.contactname,
      'ASSIGNMENTGROUP': instance.assignmentgroup,
      'ASSIGNMENTGROUPNAME': instance.assignmentgroupname,
      'ASSIGNEECONTACTCODE': instance.assigneecontactcode,
      'ASSIGNEENAME': instance.assigneename,
      'IDATE': instance.idate,
      'PLANNEDDATE': instance.planneddate,
      'PLANNEDDESC': instance.planneddesc,
      'LOCNAME': instance.locname,
      'LOCTREE': instance.loctree,
      'DESCRIPTION': instance.description,
      'SLACODE': instance.slacode,
      'ANI': instance.ani,
      'CMDB': instance.cmdb,
      'TARGET_FDATE': instance.targetFdate,
      'TARGET_RDATE': instance.targetRdate,
      'PARENTSTATUS': instance.parentstatus,
      'HYS': instance.hys,
      'HDS': instance.hds,
      'WRONGREDIRECT': instance.wrongredirect,
    };
