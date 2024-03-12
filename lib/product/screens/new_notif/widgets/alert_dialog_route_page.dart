import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';

class AlertDialogRoute {
  showAlertDialog(BuildContext alertContext, String issueCode) {
    AlertDialog alert = AlertDialog(
      title: Text(issueCode.toString() + ' Vaka Şikayet'),
      content: Text("Vaka Şikayet Sayfası Açılacaktır."),
      actions: [
        TextButton(
          child: Text("İptal"),
          onPressed: () {
            Navigator.of(alertContext, rootNavigator: true).pop(true);
          },
        ),
        TextButton(
          child: Text("Devam Et"),
          onPressed: () {
            Navigator.of(alertContext, rootNavigator: true).pop(true);

            alertContext.router.push(CaseComplaintRoute(issueCode: issueCode));
          },
        ),
      ],
    );

    showDialog(
      context: alertContext,
      builder: (BuildContext alertContext) {
        return alert;
      },
    );
  }
}
