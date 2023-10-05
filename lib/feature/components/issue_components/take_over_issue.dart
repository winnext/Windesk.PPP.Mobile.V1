import 'package:flutter/material.dart';

class TakeOverIssue extends StatelessWidget {
  const TakeOverIssue({super.key, required this.explanation, required this.title, required this.onConfirm, required this.confirmButtonText});
  final String title;
  final String explanation;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromRGBO(89, 89, 89, 1), fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                explanation,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromRGBO(89, 89, 89, 1), fontSize: 18),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: onConfirm,
            child: Text(
              confirmButtonText,
            ),
          ),
        ],
      ),
    );
  }
}
