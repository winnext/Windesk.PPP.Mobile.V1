// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_summary_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueSummaryTimeModel _$IssueSummaryTimeModelFromJson(
        Map<String, dynamic> json) =>
    IssueSummaryTimeModel(
      code: json['code'] as String?,
      respondedDate: json['respondedDate'] as String?,
      respondedTimer: json['respondedTimer'] as String?,
      fixedDate: json['fixedDate'] as String?,
      fixTimer: json['fixTimer'] as String?,
      statuscode: json['statuscode'] as String?,
      planneddate: json['planneddate'],
      targetFdate: json['targetFdate'] as String?,
      targetRdate: json['targetRdate'] as String?,
    );

Map<String, dynamic> _$IssueSummaryTimeModelToJson(
        IssueSummaryTimeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'targetFdate': instance.targetFdate,
      'targetRdate': instance.targetRdate,
      'statuscode': instance.statuscode,
      'respondedDate': instance.respondedDate,
      'respondedTimer': instance.respondedTimer,
      'fixedDate': instance.fixedDate,
      'fixTimer': instance.fixTimer,
      'planneddate': instance.planneddate,
    };
