// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_filter_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueFilterStatusModel _$IssueFilterStatusModelFromJson(
        Map<String, dynamic> json) =>
    IssueFilterStatusModel(
      code: json['CODE'] as String?,
      name: json['STATUSNAME'] as String?,
    );

Map<String, dynamic> _$IssueFilterStatusModelToJson(
        IssueFilterStatusModel instance) =>
    <String, dynamic>{
      'CODE': instance.code,
      'STATUSNAME': instance.name,
    };
