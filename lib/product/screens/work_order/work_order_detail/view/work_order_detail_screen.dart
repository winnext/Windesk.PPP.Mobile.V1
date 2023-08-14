import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WorkOrderDetailScreen extends StatelessWidget {
  const WorkOrderDetailScreen({super.key, required this.workorderId});

  final String workorderId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: CustomMainAppbar(title: ,)
        );
  }
}
