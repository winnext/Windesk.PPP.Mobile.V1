import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../style/font_sizes.dart';
import 'app_strings.dart';
import 'colors.dart';

@immutable
class TimeClass {
  final String yMDTHMSFormat = 'yyyy-MM-ddTHH:mm:ss';
  final String dMYHMSFormat = 'dd/MM/yyyy HH:mm:ss';
  final String yMDHSFormat = 'yyyyMMddHHmmss';
  final String yMDHMSSF = 'yyyy-MM-dd hh:mm:ss.SSSSSS';

  String timeRecover(timeInfo) {
    if (timeInfo == '') {
      return 'Bilgi Yok';
    }
    final String finalTime;
    final timeZone =
        '${timeInfo.toString().substring(0, 4)}-${timeInfo.toString().substring(4, 6)}-${timeInfo.toString().substring(6, 8)}T${timeInfo.toString().substring(8, 10)}:${timeInfo.toString().substring(10, 12)}:${timeInfo.toString().substring(12, 14)}';

    if (timeZone.toString().contains(".")) {
      DateTime dateTime = DateFormat(yMDTHMSFormat).parse(timeZone.toString());
      finalTime = DateFormat(dMYHMSFormat).format(dateTime);
    } else {
      DateTime dateTime = DateFormat(yMDTHMSFormat).parse(timeZone.toString());
      finalTime = DateFormat(dMYHMSFormat).format(dateTime);
    }
    //print('finalTİme : ' + finalTime.toString());
    return finalTime;
  }

  String timeRecover2(timeInfo) {
    final String finalTime;
    final timeZone =
        '${timeInfo.toString().substring(0, 4)}-${timeInfo.toString().substring(4, 6)}-${timeInfo.toString().substring(6, 8)}T${timeInfo.toString().substring(8, 10)}:${timeInfo.toString().substring(10, 12)}:${timeInfo.toString().substring(12, 14)}';

    if (timeZone.toString().contains(".")) {
      DateTime dateTime = DateFormat(yMDTHMSFormat).parse(timeZone.toString());
      finalTime = DateFormat(dMYHMSFormat).format(dateTime);
    } else {
      DateTime dateTime = DateFormat(yMDTHMSFormat).parse(timeZone.toString());
      finalTime = dateTime.toString();
    }
    return finalTime;
  }

  String timeDifference(date2) {
    final date1 = DateTime.now();
    date2 = timeRecover2(date2);
    DateTime t2 = DateTime.parse(date2);
    String dateNow = DateFormat(yMDHSFormat).format(date1);
    String dateNow2 = DateFormat(yMDHSFormat).format(t2);
    bool isPassDate = int.parse(dateNow.toString()) - int.parse(dateNow2.toString()) > 0 ? true : false;
    Duration date3 = isPassDate ? date1.difference(t2) : t2.difference(date1);
    String finalDuration =
        '''${date3.inDays} ${AppStrings.day} ${int.parse(date3.inHours.toString()) % 24} ${AppStrings.hour} ${int.parse(date3.inMinutes.toString()) % 60} ${AppStrings.minute} ${int.parse(date3.inSeconds.toString()) % 60} ${AppStrings.second} ''';
    return finalDuration;
  }

  TextStyle fixStyle(timer, targetDate, fixedDate) {
    String dateNow = DateFormat(yMDHSFormat).format(DateTime.now());
    final TextStyle conditionOfTextStyle;
    if (timer == "0") {
      conditionOfTextStyle = int.parse(targetDate.toString()) - int.parse(fixedDate.toString()) > 0
          ? TextStyle(
              color: APPColors.Main.white, backgroundColor: APPColors.Main.green, fontSize: FontSizes.caption - 1, fontWeight: FontWeight.bold)
          : TextStyle(color: APPColors.Main.white, backgroundColor: APPColors.Main.red, fontSize: FontSizes.caption - 1, fontWeight: FontWeight.bold);
    } else {
      conditionOfTextStyle = int.parse(dateNow.toString()) - int.parse(targetDate.toString()) < 0
          ? TextStyle(color: APPColors.Main.green, backgroundColor: APPColors.Main.white, fontSize: FontSizes.caption - 1)
          : TextStyle(color: APPColors.Main.red, backgroundColor: APPColors.Main.white, fontSize: FontSizes.caption - 1);
    }

    return conditionOfTextStyle;
  }

  String convertSecToStringFormat(String second) {
    final int seconds = int.parse(second);
    final int h = (seconds / 3600).floor();
    final int m = ((seconds % 3600) / 60).floor();
    final int s = ((seconds % 3600) % 60).floor();

    final String hDisplay = h > 0 ? ' $h ${AppStrings.hour} ' : '';
    final String mDisplay = m > 0 ? '$m ${AppStrings.minute} ' : '';
    final String sDisplay = s > 0 ? '$s ${AppStrings.second} ' : '';

    return hDisplay + mDisplay + sDisplay;
  }
}
