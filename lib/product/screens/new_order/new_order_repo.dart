// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../feature/enums/shared_enums.dart';

class NewOrderRepo {
  // Platform messages may fail, so we use a try/catch PlatformException.

  Dio dio = Dio();

  Future woCreate(woSpace, woService, woName, woNameLabel, priority_type,
      workorder_cfg, woDesc, image) async {
    String deviceToken = await SharedManager().getString(SharedEnum.deviceId);

    String woCreateUrl =
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceToken + '&action=saveWorkorderNfs&workorder_type=' + woName + '&workorder_name=' + woNameLabel + '&workorder_service=' + woService + '&workorder_space=' + woSpace + '&workorder_description=' + woDesc + '&workorder_priority_type=' + priority_type}&workorder_cfg=' +
            workorder_cfg;

    print(woCreateUrl);

    try {
      BaseOptions options = BaseOptions(
          baseUrl: woCreateUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 6), // 60 seconds
          receiveTimeout: const Duration(seconds: 6) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(woCreateUrl);

      print(response);
      if (response.data['success'] == true) {
        if (image.length > 0) {
          woCreateFotoEkle(response.data['code'], image, '');
        }
        return [
          [1],
          response.data
        ];
      } else {
        return [
          [0],
          response.data['uyari']
        ];
      }
      // ignore: deprecated_member_use
    } on DioError {
      print('girdi');
      return [
        [0],
        'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz'
      ];
    }
  }

  Future woCreateFotoEkle(woCode, image, desc) async {
    String deviceToken = await SharedManager().getString(SharedEnum.deviceId);

    String? kadi = await SharedManager().getString(SharedEnum.userCode);

    String url = ServiceTools.baseUrlV1 +
        ServiceTools.tokenV1 +
        deviceToken +
        '&action=addAttachment&username=$kadi&moduleName=workorder&issueCode=$woCode';
    print('Foto ekle url : $url');
    FormData formData =
        FormData.fromMap({"base64string": image, 'description': desc});
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
        data: formData,
      );
      print('Foto ekle response  : ${response.data}');

      return response.data;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print('notsuccess');
      print(e);
      return 'notsuccess';
    }
  }

  Future woCreateHizmetListesiApi() async {
    String deviceToken = await SharedManager().getString(SharedEnum.deviceId);

    String? kadi = await SharedManager().getString(SharedEnum.userCode);

    String woCreateHizmetListesiUrl = ServiceTools.baseUrlV1 +
        ServiceTools.tokenV1 +
        deviceToken +
        '&action=getServices&username=' +
        kadi.toString();
    print(woCreateHizmetListesiUrl);

    try {
      BaseOptions options = BaseOptions(
          baseUrl: woCreateHizmetListesiUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 6), // 60 seconds
          receiveTimeout: const Duration(seconds: 6) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(woCreateHizmetListesiUrl);

      //print(response);
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return [];
      }
      // ignore: deprecated_member_use
    } on DioError {
      print('girdi');
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future checkWorkorderByAuthorizedServicesApi(
      String kadi, String woCode) async {
    String deviceToken = await SharedManager().getString(SharedEnum.deviceId);

    String? kadi = await SharedManager().getString(SharedEnum.userCode);

    String checkSonucUrl = ServiceTools.baseUrlV1 +
        ServiceTools.tokenV1 +
        deviceToken +
        '&action=checkWorkorderByAuthorizedServices&workorderCode=$woCode&username=$kadi';
    print('iş emri arama url : ' + checkSonucUrl);

    try {
      BaseOptions options = BaseOptions(
          baseUrl: checkSonucUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 6), // 60 seconds
          receiveTimeout: const Duration(seconds: 6) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(checkSonucUrl);

      print(response);
      if (response.data['result'] == 'success') {
        return response.data['count'].toString();
      } else {
        print('else');
        if (response.data['result'] == "Invalid Device Id") {
          return "Invalid Device Id";
        } else {
          return response.data['count'].toString();
        }
      }
      // ignore: deprecated_member_use
    } on DioError {
      print('girdi');
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }
}
