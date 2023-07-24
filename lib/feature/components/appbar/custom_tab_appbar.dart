// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';

class CustomTabAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabAppbar({
    Key? key,
    required this.title,
    this.returnBack,
  }) : super(key: key);

  final String title;
  final bool? returnBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: APPColors.Main.black),
      ),
      centerTitle: true,
      leading: returnBack == true
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black))
          : null,
      backgroundColor: APPColors.Main.white,
      elevation: 10,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
