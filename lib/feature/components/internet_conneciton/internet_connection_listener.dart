// ignore_for_file: avoid_print

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vibration/vibration.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';
import 'package:wm_ppp_4/feature/service/local_db/db.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class InternetListenerClass {
  checkCache() async {
    print('GİRDİ');
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cache.db');

    print('GİRDİ2');

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
    });

    print('GİRDİ3');

    List<Map> list = await database.rawQuery('SELECT * FROM cache');
    print(list);
    // list.map((e) async {
    //   print(e);
    //   await ElasticLog().sendLogWithData(e);
    // });
    for (var item in list) {
      print(item);
      ElasticLog().sendLog(
          item['logLevel'], item['title'], item['message'], item['activity']);
      //ElasticLog().sendLog(item['data']);
      await database
          .rawDelete('DELETE FROM cache WHERE id = ?', ['$item["id"]']);
    }

    print('GİRDİ5');
  }

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
            checkCache();
            ElasticLog().sendLog('error', 'NetworkReConnected - ',
                'İnternete yeniden bağlanıldı.', 'networkReConnected - ');
            snackBar(context, 'İnternet bağlantısı sağlandı. ', 'success');
            Vibration.vibrate(duration: 500);
          }
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          durum = 0;

          ElasticLog().sendLog('error', 'NetworkDisconnected - ',
              'İnternet bağlantısı kesildi.', 'networkDisconnected - ');
          snackBar(
              context,
              'İnternet bağlantısı bulunamadı. Lütfen kontrol ediniz.',
              'connectionError');
          Vibration.vibrate(duration: 500);

          break;
      }
    });
  }
}
