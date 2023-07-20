// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueListModel _$IssueListModelFromJson(Map<String, dynamic> json) =>
    IssueListModel(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      relatedcode: json['RELATEDCODE'] as String?,
      target_fdate: json['TARGET_FDATE'] as String?,
      target_rdate: json['TARGET_RDATE'] as String?,
      sumdec1: json['SUMDESC1'] as String?,
      cat1: json['CAT1'] as String?,
      statusname: json['STATUSNAME'] as String?,
      statuscode: json['STATUSCODE'] as String?,
      idate: json['IDATE'] as String?,
      responded_idate: json['RESPONDED_IDATE'] as String?,
      location: json['LOCATION'] as String?,
      description: json['DESCRIPTION'] as String?,
      fixed_idate: json['FIXED_IDATE'] as String?,
      planneddate: json['PLANNEDDATE'] as String?,
      response_timer: json['response_timer'],
      fixed_timer: json['fixed_timer'],
      space: json['SPACE'] as String?,
    );

Map<String, dynamic> _$IssueListModelToJson(IssueListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'relatedcode': instance.relatedcode,
      'target_fdate': instance.target_fdate,
      'target_rdate': instance.target_rdate,
      'sumdec1': instance.sumdec1,
      'cat1': instance.cat1,
      'statusname': instance.statusname,
      'statuscode': instance.statuscode,
      'idate': instance.idate,
      'responded_idate': instance.responded_idate,
      'location': instance.location,
      'description': instance.description,
      'fixed_idate': instance.fixed_idate,
      'planneddate': instance.planneddate,
      'response_timer': instance.response_timer,
      'fixed_timer': instance.fixed_timer,
      'space': instance.space,
    };
