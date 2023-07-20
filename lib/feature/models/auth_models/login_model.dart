import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wm_ppp_4/feature/models/auth_models/record_model.dart';

part 'generator/login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final String? resultcode;
  final String? result;
  final List<dynamic>? record;

  const LoginModel({
    this.resultcode,
    this.result,
    this.record,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [
        resultcode,
        result,
        record,
      ];
}
