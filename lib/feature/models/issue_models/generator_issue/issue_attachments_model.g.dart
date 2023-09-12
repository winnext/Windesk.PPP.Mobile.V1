// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_attachments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueAttachmentsModel _$IssueAttachmentsModelFromJson(Map<String, dynamic> json) => IssueAttachmentsModel(
      id: json['ID'] as int?,
      name: json['NAME'] as String?,
      filename: json['FILENAME'] as String?,
      dispfilename: json['DISPFILENAME'] as String?,
      atchtype: json['atchtype'] as String?,
      filepath: json['filepath'] as String?,
      idate: json['idate'],
    );

Map<String, dynamic> _$IssueAttachmentsModelToJson(IssueAttachmentsModel instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'FILENAME': instance.filename,
      'DISPFILENAME': instance.dispfilename,
      'ATCHTYPE': instance.atchtype,
      'FILEPATH': instance.filepath,
      'IDATE': instance.idate,
    };
