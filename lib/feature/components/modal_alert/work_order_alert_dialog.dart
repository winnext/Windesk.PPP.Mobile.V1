import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings.dart';

class WorkOrderAlertDialog {
  static Future showAlertDialog(BuildContext context, String title, String subtitle) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop<bool>(false),
              child: const Text(AppStrings.reject),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop<bool>(true),
              child: const Text(AppStrings.approve),
            ),
          ],
        );
      },
    );
  }
}
