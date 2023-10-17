import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';

class DropDownInputFields extends StatefulWidget {
  const DropDownInputFields({
    super.key,
    required this.labelText,
    required this.onChangedFunction,
    required this.rightIcon,
    required this.dropDownArray,
    this.hintText,
  });

  final String labelText;
  final String? hintText;
  final Function onChangedFunction;
  final IconData rightIcon;
  final List<String> dropDownArray;

  @override
  State<DropDownInputFields> createState() => _DropDownInputFieldsState();
}

class _DropDownInputFieldsState extends State<DropDownInputFields> {
  @override
  Widget build(BuildContext context) {
  String selectedValue = widget.dropDownArray.first;
    return DropdownButtonFormField(
      isExpanded: true,
      value: selectedValue,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: CustomBorderRadius.textFieldBorderRadius, borderSide: BorderSide(color: APPColors.Main.black, width: 4)),
          labelText: widget.labelText,
          hintText: widget.hintText ?? ''),
      icon: Icon(widget.rightIcon),
      items: widget.dropDownArray.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: TextStyle(color: APPColors.Main.black),
          ),
        );
      }).toList(),
      onChanged: (newValue) => {
        widget.onChangedFunction(newValue),
        setState(() {
          selectedValue = newValue.toString();
          print('selectedValue' + selectedValue.toString());
        }),
      },
    );
  }
}
