// ignore_for_file: avoid_print

import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vibration/vibration.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';

class InternetListenerClass {
  internetConnection(context) async {
    // Simple check to see if we have internet

    var durum = 1;

    InternetConnectionChecker().addresses = <AddressCheckOptions>[
      AddressCheckOptions(
        address: InternetAddress(
          ServiceTools.ipv4adress, //10.86.4.46 aeh
          // 1.1.1.1 cihaz interneti
          type: InternetAddressType.IPv4,
        ),
        port: 80,
      ),
    ];

    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          if (durum != 1) {
            snackBar(context, 'İnternet bağlantısı sağlandı. ', 'success');
            Vibration.vibrate(duration: 500);
          }
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          durum = 0;
          snackBar(
              context,
              'İnternet bağlantısı bulunamadı. Lütfen kontrol ediniz.',
              'error');
          Vibration.vibrate(duration: 500);

          break;
      }
    });
  }
}
