// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../issue_operation_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueOperationList _$IssueOperationListFromJson(Map<String, dynamic> json) => IssueOperationList(
      isPhoto: json['IS_PHOTO'] as bool?,
      isTakeOver: json['IS_TAKE_OVER'] as bool?,
      isActivity: json['IS_ACTIVITY'] as bool?,
      isChangeCfg: json['IS_CHANGE_CFG'] as bool?,
      isSparepart: json['IS_SPAREPART'] as bool?,
      isPlannedCancel: json['IS_PLANNED_CANCEL'] as bool?,
    );

Map<String, dynamic> _$IssueOperationListToJson(IssueOperationList instance) => <String, dynamic>{
      'IS_PHOTO': instance.isPhoto,
      'IS_TAKE_OVER': instance.isTakeOver,
      'IS_ACTIVITY': instance.isActivity,
      'IS_CHANGE_CFG': instance.isChangeCfg,
      'IS_SPAREPART': instance.isSparepart,
      'IS_PLANNED_CANCEL': instance.isPlannedCancel,
    };
