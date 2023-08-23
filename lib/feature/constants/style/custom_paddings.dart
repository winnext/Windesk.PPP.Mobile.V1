import 'package:flutter/material.dart';

@immutable
class CustomPaddings {
  const CustomPaddings._();
  static EdgeInsets textFieldsInputWithAction = const EdgeInsets.all(8.0);
  static EdgeInsets onlyBottomLow = const EdgeInsets.only(bottom: 8.0);
  static EdgeInsets onlyTopLow = const EdgeInsets.only(top: 8.0);
  static EdgeInsets topAndBottomLow = const EdgeInsets.fromLTRB(0, 5, 0, 5);

  static EdgeInsets onlyHorizontalHigh = const EdgeInsets.symmetric(horizontal: 30.0);
  static EdgeInsets onlyBottomMedium = const EdgeInsets.only(bottom: 16.0);

  static EdgeInsets pageNormal = const EdgeInsets.symmetric(vertical: 10, horizontal: 15);
  static EdgeInsets pageNormalVerticalX = const EdgeInsets.symmetric(vertical: 15, horizontal: 15);
  static EdgeInsets pageNormalHorizontalX = const EdgeInsets.symmetric(vertical: 10, horizontal: 25);
  static EdgeInsets pageHigh = const EdgeInsets.symmetric(vertical: 20, horizontal: 30);
}
