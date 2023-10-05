// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_available_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueAvailableActivities _$IssueAvailableActivitiesFromJson(
        Map<String, dynamic> json) =>
    IssueAvailableActivities(
      activityid: json['ACTIVITYID'] as String?,
      code: json['CODE'] as String?,
      acttypecode: json['ACTTYPECODE'] as String?,
      name: json['NAME'] as String?,
      fileattach: json['FILEATTACH'] as String?,
      additionaltime: json['ADDITIONALTIME'],
      assigneeccType: json['ASSIGNEECC_TYPE'],
      assigneeccOrg: json['ASSIGNEECC_ORG'],
      assigneeccUser: json['ASSIGNEECC_USER'],
      description: json['DESCRIPTION'],
      status: json['STATUS'] as String?,
      asggroup: json['ASGGROUP'],
      asggroupname: json['ASGGROUPNAME'],
      statusname: json['STATUSNAME'] as String?,
      minDescLength: json['MIN_DESC_LENGTH'] as String?,
      mobilePhoto: json['MOBILE_PHOTO'] as String?,
      barcodeSpace: json['BARCODE_SPACE'] as String?,
      barcodeCfg: json['BARCODE_CFG'] as String?,
      additionaltimeInput: json['ADDITIONALTIME_INPUT'] as String?,
    );

Map<String, dynamic> _$IssueAvailableActivitiesToJson(
        IssueAvailableActivities instance) =>
    <String, dynamic>{
      'ACTIVITYID': instance.activityid,
      'CODE': instance.code,
      'ACTTYPECODE': instance.acttypecode,
      'NAME': instance.name,
      'FILEATTACH': instance.fileattach,
      'ADDITIONALTIME': instance.additionaltime,
      'ASSIGNEECC_TYPE': instance.assigneeccType,
      'ASSIGNEECC_ORG': instance.assigneeccOrg,
      'ASSIGNEECC_USER': instance.assigneeccUser,
      'DESCRIPTION': instance.description,
      'STATUS': instance.status,
      'ASGGROUP': instance.asggroup,
      'ASGGROUPNAME': instance.asggroupname,
      'STATUSNAME': instance.statusname,
      'MIN_DESC_LENGTH': instance.minDescLength,
      'MOBILE_PHOTO': instance.mobilePhoto,
      'BARCODE_SPACE': instance.barcodeSpace,
      'BARCODE_CFG': instance.barcodeCfg,
      'ADDITIONALTIME_INPUT': instance.additionaltimeInput,
    };
