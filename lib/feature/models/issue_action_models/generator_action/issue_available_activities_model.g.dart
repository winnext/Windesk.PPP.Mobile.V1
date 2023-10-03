// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_available_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueAvailableActivities _$IssueAvailableActivitiesFromJson(
        Map<String, dynamic> json) =>
    IssueAvailableActivities(
      activityid: json['activityid'] as String?,
      code: json['code'] as String?,
      acttypecode: json['acttypecode'] as String?,
      name: json['name'] as String?,
      fileattach: json['fileattach'] as String?,
      additionaltime: json['additionaltime'],
      assigneeccType: json['assigneeccType'],
      assigneeccOrg: json['assigneeccOrg'],
      assigneeccUser: json['assigneeccUser'],
      description: json['description'],
      status: json['status'] as String?,
      asggroup: json['asggroup'],
      asggroupname: json['asggroupname'],
      statusname: json['statusname'] as String?,
      minDescLength: json['minDescLength'] as String?,
      mobilePhoto: json['mobilePhoto'] as String?,
      barcodeSpace: json['barcodeSpace'] as String?,
      barcodeCfg: json['barcodeCfg'] as String?,
      additionaltimeInput: json['additionaltimeInput'] as String?,
    );

Map<String, dynamic> _$IssueAvailableActivitiesToJson(
        IssueAvailableActivities instance) =>
    <String, dynamic>{
      'activityid': instance.activityid,
      'code': instance.code,
      'acttypecode': instance.acttypecode,
      'name': instance.name,
      'fileattach': instance.fileattach,
      'additionaltime': instance.additionaltime,
      'assigneeccType': instance.assigneeccType,
      'assigneeccOrg': instance.assigneeccOrg,
      'assigneeccUser': instance.assigneeccUser,
      'description': instance.description,
      'status': instance.status,
      'asggroup': instance.asggroup,
      'asggroupname': instance.asggroupname,
      'statusname': instance.statusname,
      'minDescLength': instance.minDescLength,
      'mobilePhoto': instance.mobilePhoto,
      'barcodeSpace': instance.barcodeSpace,
      'barcodeCfg': instance.barcodeCfg,
      'additionaltimeInput': instance.additionaltimeInput,
    };
