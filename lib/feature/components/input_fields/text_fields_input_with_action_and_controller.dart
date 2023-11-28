import 'package:flutter/material.dart';

import '../../constants/style/border_radius.dart';

class TextFieldsInputWithActionAndController extends StatelessWidget {
  const TextFieldsInputWithActionAndController(
      {super.key,
      required this.labelText,
      required this.actionIcon,
      required this.actionFunction,
      required this.textController,
      this.hinText,
      this.readOnly});
  final Function actionFunction;
  final String labelText;
  final String? hinText;
  final IconData actionIcon;
  final TextEditingController textController;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              readOnly: readOnly ?? false,
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: CustomBorderRadius.textFieldBorderRadius),
                labelText: labelText,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: IconButton(
              icon: Icon(actionIcon),
              onPressed: () => actionFunction(),
            ),
          ),
        ],
      ),
    );
  }
}
