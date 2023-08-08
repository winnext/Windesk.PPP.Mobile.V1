// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderListModel _$WorkOrderListModelFromJson(Map<String, dynamic> json) => WorkOrderListModel(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      modulecode: json['MODULECODE'] as String?,
      service: json['SERVICE'] as String?,
      serviceName: json['SERVICE_NAME'] as String?,
      modulelocation: json['MODULELOCATION'] as String?,
      name: json['NAME'] as String?,
      responsible: json['RESPONSIBLE'] as String?,
      statusname: json['STATUSNAME'] as String?,
      plannedEnddate: json['PLANNED_ENDDATE'] as String?,
    );

Map<String, dynamic> _$WorkOrderListModelToJson(WorkOrderListModel instance) => <String, dynamic>{
      'ID': instance.id,
      'CODE': instance.code,
      'MODULECODE': instance.modulecode,
      'SERVICE': instance.service,
      'SERVICE_NAME': instance.serviceName,
      'MODULELOCATION': instance.modulelocation,
      'NAME': instance.name,
      'RESPONSIBLE': instance.responsible,
      'STATUSNAME': instance.statusname,
      'PLANNED_ENDDATE': instance.plannedEnddate,
    };
