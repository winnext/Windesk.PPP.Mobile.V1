import 'package:flutter/material.dart';

@immutable
class NullCheckWidget {
  // ignore: non_constant_identifier_names
  Widget nullCheckWidget(String? text, Widget EmptyWidget, Widget fullFilledWidget) {
    if (text == '' || text == null || text == 'null') {
      return EmptyWidget;
    } else {
      return fullFilledWidget;
    }
  }

  Widget conditionCheckWidget(bool condition, Widget fullFilledWidget) {
    if (condition) {
      return fullFilledWidget;
    } else {
      return Container();
    }
  }
}
