// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_issue/issue_list_model.g.dart';

@JsonSerializable()
class IssueListModel extends Equatable {
  final String? id;
  final String? code;
  final String? relatedcode;
  final String? target_fdate;
  final String? target_rdate;
  final String? sumdec1;
  final String? cat1;
  final String? statusname;
  final String? statuscode;
  final String? idate;
  final String? responded_idate;
  final String? location;
  final String? description;
  final String? fixed_idate;
  final String? planneddate;
  final Object? response_timer;
  final Object? fixed_timer;
  final String? space;

  const IssueListModel({
    this.id,
    this.code,
    this.relatedcode,
    this.target_fdate,
    this.target_rdate,
    this.sumdec1,
    this.cat1,
    this.statusname,
    this.statuscode,
    this.idate,
    this.responded_idate,
    this.location,
    this.description,
    this.fixed_idate,
    this.planneddate,
    this.response_timer,
    this.fixed_timer,
    this.space,
  });

  factory IssueListModel.fromJson(Map<String, dynamic> json) => _$IssueListModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueListModelToJson(this);

  static List<IssueListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueListModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        code,
        relatedcode,
        target_fdate,
        target_rdate,
        sumdec1,
        cat1,
        statusname,
        statuscode,
        idate,
        responded_idate,
        location,
        description,
        fixed_idate,
        planneddate,
        response_timer,
        fixed_timer,
        space,
      ];
}
