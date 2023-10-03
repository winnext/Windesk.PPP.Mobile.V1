// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_summary_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueSummaryTimeModel _$IssueSummaryTimeModelFromJson(
        Map<String, dynamic> json) =>
    IssueSummaryTimeModel(
      code: json['CODE'] as String?,
      respondedDate: json['RESPONDED_DATE'] as String?,
      respondedTimer: json['RESPONDED_TIMER'] as String?,
      fixedDate: json['FIXED_DATE'] as String?,
      fixTimer: json['FIX_TIMER'] as String?,
      statuscode: json['STATUS_CODE'] as String?,
      planneddate: json['PLANNED_DATE'],
      targetFdate: json['TARGET_FDATE'] as String?,
      targetRdate: json['TARGET_RDATE'] as String?,
    );

Map<String, dynamic> _$IssueSummaryTimeModelToJson(
        IssueSummaryTimeModel instance) =>
    <String, dynamic>{
      'CODE': instance.code,
      'TARGET_FDATE': instance.targetFdate,
      'TARGET_RDATE': instance.targetRdate,
      'STATUS_CODE': instance.statuscode,
      'RESPONDED_DATE': instance.respondedDate,
      'RESPONDED_TIMER': instance.respondedTimer,
      'FIXED_DATE': instance.fixedDate,
      'FIX_TIMER': instance.fixTimer,
      'PLANNED_DATE': instance.planneddate,
    };
