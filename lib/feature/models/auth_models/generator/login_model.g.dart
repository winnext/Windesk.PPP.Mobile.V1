// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      resultcode: json['resultcode'] as String?,
      result: json['result'] as String?,
      record: json['record'] ,

    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) => <String, dynamic>{
      'resultcode': instance.resultcode,
      'result': instance.result,
      'record': instance.record,
    };
