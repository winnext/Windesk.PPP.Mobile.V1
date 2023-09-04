// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../work_order_asset_search_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderAssetSearchList _$WorkOrderAssetSearchListFromJson(
        Map<String, dynamic> json) =>
    WorkOrderAssetSearchList(
      code: json['CODE'] as String?,
      serialNo: json['SERIALNO'] as String?,
      name: json['NAME'] as String?,
      status: json['STATUS'] as String?,
      locationCode: json['LOCATIONCODE'] as String?,
      binaAdi: json['bina_adi'] as String?,
      katAdi: json['kat_adi'] as String?,
      kanatAdi: json['kanat_adi'] as String?,
      mahalAdi: json['mahal_adi'] as String?,
      loctree: json['LOCTREE'] as String?,
    );

Map<String, dynamic> _$WorkOrderAssetSearchListToJson(
        WorkOrderAssetSearchList instance) =>
    <String, dynamic>{
      'CODE': instance.code,
      'SERIALNO': instance.serialNo,
      'NAME': instance.name,
      'STATUS': instance.status,
      'LOCATIONCODE': instance.locationCode,
      'bina_adi': instance.binaAdi,
      'kat_adi': instance.katAdi,
      'kanat_adi': instance.kanatAdi,
      'mahal_adi': instance.mahalAdi,
      'LOCTREE': instance.loctree
    };
