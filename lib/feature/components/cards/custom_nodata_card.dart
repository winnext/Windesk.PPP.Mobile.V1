import 'package:flutter/material.dart';
import '../../l10n/locale_keys.g.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      LocaleKeys.noInfo,
      style: TextStyle(fontWeight: FontWeight.bold),
    ));
  }
}
