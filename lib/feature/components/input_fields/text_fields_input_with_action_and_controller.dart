import 'package:flutter/material.dart';

import '../../constants/style/border_radius.dart';

class TextFieldsInputWithActionAndController extends StatelessWidget {
  const TextFieldsInputWithActionAndController({
    super.key,
    required this.labelText,
    required this.actionIcon,
    required this.actionFunction,
    required this.textController,
    this.hinText
  });
  final Function actionFunction;
  final String labelText;
  final String? hinText;
  final IconData actionIcon;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.74,
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.textFieldBorderRadius),
              labelText: labelText,
              hintText: hinText ?? '',
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
    );
  }
}
