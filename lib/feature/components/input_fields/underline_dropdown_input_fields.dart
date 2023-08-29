import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';

class UnderlineDropdownInputFields extends StatelessWidget {
  const UnderlineDropdownInputFields({super.key, required this.labelText, required this.dropDownArray, required this.onChangedFunction});

  final String labelText;
  final List<String> dropDownArray;
  final Function onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      isExpanded: true,
      style: TextStyle(color: APPColors.Main.white),
      dropdownColor: APPColors.Modal.blue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: APPColors.Main.white),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: APPColors.Main.white)),
        border: UnderlineInputBorder(borderSide: BorderSide(color: APPColors.Main.white)),
      ),
      items: dropDownArray.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items, style: TextStyle(color: APPColors.Main.white)),
        );
      }).toList(),
      onChanged: (val) => onChangedFunction(val),
    );
  }
}
