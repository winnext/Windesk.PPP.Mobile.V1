import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/record_model.g.dart';

@JsonSerializable()
class RecordModel extends Equatable {
  final String? code;
  final String? fullname;

  const RecordModel({
    this.code,
    this.fullname,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) => _$RecordModelFromJson(json);

  @override
  List<Object?> get props => [
        code,
        fullname,
      ];
}
