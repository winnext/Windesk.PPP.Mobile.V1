import 'package:flutter/material.dart';
import '../../constants/other/colors.dart';

class CustomWoSummaryDivider extends StatelessWidget {
  const CustomWoSummaryDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: APPColors.Main.black,
      indent: 2,
      endIndent: 2,
      thickness: 0.1,
    );
  }
}
