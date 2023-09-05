// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueActivitiesModel _$IssueActivitiesModelFromJson(Map<String, dynamic> json) => IssueActivitiesModel(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      idate: json['IDATE'] as String?,
      description: json['DESCRIPTION'] as String?,
      iuser: json['IUSER'] as String?,
      iusername: json['IUSERNAME'] as String?,
      additionaltime: json['ADDITIONALTIME'],
    );

Map<String, dynamic> _$IssueActivitiesModelToJson(IssueActivitiesModel instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'IDATE': instance.idate,
      'DESCRIPTION': instance.description,
      'IUSER': instance.iuser,
      'IUSERNAME': instance.iusername,
      'ADDITIONALTIME': instance.additionaltime,
    };
