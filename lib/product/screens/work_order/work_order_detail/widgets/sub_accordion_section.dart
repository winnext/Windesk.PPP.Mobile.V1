import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';

import '../../../../../feature/constants/other/app_icons.dart';
import '../../../../../feature/constants/other/colors.dart';

@immutable
final class SubAccordionSection {
  const SubAccordionSection._();

  static AccordionSection subAccordion(
    BuildContext context,
    String title,
    IconData icon,
    Function openSection,
    Widget content,
  ) {
    return AccordionSection(
        isOpen: false,
        headerBackgroundColor: APPColors.Accent.black,
        headerBackgroundColorOpened: APPColors.Accent.black,
        leftIcon: Icon(icon, color: APPColors.Main.white),
        contentBorderColor: APPColors.Accent.black,
        rightIcon: const Icon(AppIcons.add, size: 0),
        contentVerticalPadding: 0,
        contentHorizontalPadding: 0,
        contentBorderRadius: 0,
        contentBorderWidth: 0,
        onOpenSection: () => openSection(),
        header: Text(title, style: TextStyle(color: APPColors.Main.white, letterSpacing: 1.5)),
        content: content);
  }
}
