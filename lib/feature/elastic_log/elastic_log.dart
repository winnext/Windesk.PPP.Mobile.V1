import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';

import '../database/shared_manager.dart';
import '../enums/shared_enums.dart';

class ElasticLog {
  storeData(logLevel, title, message, activity) async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cache.db');

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
    });

// Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO cache(loglevel,title,message,activity) VALUES(?, ?, ?, ?)',
          [logLevel, title, message, activity]);
      print('inserted1: $id1');
    });
  }

  sendLog(logLevel, title, message, activity) async {
    var now = DateTime.now();

    String url = ServiceTools.loggerUrl;
    var deviceID = await SharedManager().getString(SharedEnum.deviceId);
    var ip = await SharedManager().getString(SharedEnum.ipAdress);
    var deviceModel = await SharedManager().getString(SharedEnum.deviceModel);
    var deviceOS = await SharedManager().getString(SharedEnum.deviceType);
    var appVersion = await SharedManager().getString(SharedEnum.appVersion);
    var osVersion = await SharedManager().getString(SharedEnum.osVersion);
    var userCode = await SharedManager().getString(SharedEnum.userCode);
    print('deviceModel : ' + deviceModel);
    print('deviceOS : ' + deviceOS);
    print('appVersion : ' + appVersion);
    print('osVersion : ' + osVersion);

    var logData = {
      "GLOBAL": {
        "APP_NAME": ServiceTools.appName,
        "ATTACHPATH": ServiceTools.attachPath,
        "ATTACHPATHLIVE": ServiceTools.attachPathLive,
        "BASE_URL_V1": ServiceTools.baseUrlV1,
        "BASE_URL_V2": ServiceTools.baseUrlV2,
        "ENVIRONMENT": ServiceTools.environment,
        "LOGGER_URL": ServiceTools.loggerUrl,
        "PARENTSTATUS": "acık",
        "PPP_PROJECT": ServiceTools.appName,
        "SURVEY_URL": "http://10.126.12.41:8080/index.php/866255?lang=tr",
        "SURVEY_URL_2": "http://10.126.12.141:8080/index.php/355199?lang=tr",
        "TOKEN_V2": ServiceTools.tokenV2
      },
      "app_version": appVersion,
      "connected_ssid": "unknown",
      "current_activity": "$activity" + ' - ' + now.toString(),
      "device": {
        "brand": deviceModel,
        "id": deviceID,
        "ip": ip,
        "model": deviceModel,
        "os": deviceOS,
        "os_version": osVersion
      },
      "log_level": logLevel,
      "log_message": message + ' - ' + now.toString(),
      "native_message": message + ' - ' + now.toString(),
      "username": userCode
    };

    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 3), // 60 seconds
          receiveTimeout: const Duration(seconds: 3) // 60 seconds
          );
      Dio dio = Dio(options);
      final response = await dio.post(
        url,
        data: logData,
      );
      print('ELASTIC : ');
      print(logData);
      return response.data;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print('notsuccess');
      print(e);

      storeData(logLevel, title, message, activity);

      return 'notsuccess';
    }
  }
}
