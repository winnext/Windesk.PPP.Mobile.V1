import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/style/border_radius.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    super.key,
    required this.onChangedFunction,
    required this.labelText,
    required this.actionIcon,
    required this.actionFunction,
  });
  final Function onChangedFunction;
  final Function actionFunction;
  final String labelText;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: CustomBorderRadius.textFieldBorderRadius),
            labelText: labelText,
          ),
          onChanged: (inputValue) => onChangedFunction(inputValue),
        ),
        IconButton(
            icon: Icon(actionIcon), onPressed: () => actionFunction(context)),
      ],
    );
  }
}
