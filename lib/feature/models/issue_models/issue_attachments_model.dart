import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_issue/issue_attachments_model.g.dart';

@JsonSerializable()
class IssueAttachmentsModel extends Equatable {
  final int? id;
  final String? name;
  final String? filename;
  final String? dispfilename;
  final String? atchtype;
  final String? filepath;
  final dynamic idate;

  const IssueAttachmentsModel({
    this.id,
    this.name,
    this.filename,
    this.dispfilename,
    this.atchtype,
    this.filepath,
    this.idate,
  });

  factory IssueAttachmentsModel.fromJson(Map<String, dynamic> json) => _$IssueAttachmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueAttachmentsModelToJson(this);

  static List<IssueAttachmentsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IssueAttachmentsModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [id, name, filename, dispfilename, atchtype, filepath, idate];
}
