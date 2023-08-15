// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_tracing_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderTracingListModel _$WorkOrderTracingListModelFromJson(
        Map<String, dynamic> json) =>
    WorkOrderTracingListModel(
      code: json['code'] as String?,
      name: json['name'] as String?,
      count: json['count'] as String?,
    );

Map<String, dynamic> _$WorkOrderTracingListModelToJson(
        WorkOrderTracingListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'count': instance.count,
    };
