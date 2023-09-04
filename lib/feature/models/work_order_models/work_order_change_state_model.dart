import 'package:equatable/equatable.dart';

class WorkOrderChangeStateModel extends Equatable {
  final bool? result;
  final String? message;

  const WorkOrderChangeStateModel({this.result, this.message});

  @override
  List<Object?> get props => [result, message];
}
