import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_asset_search_list_model.dart';
import 'package:wm_ppp_4/product/screens/search/service/search_service_repo.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';

class SearchServiceRepoImpml extends SearchServiceRepository {
  Future mahalAraMahalDetayAnlikIsEmri(spaceCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getWorkorderFromCode&username=' + userName.toString() + '&spaceCode=' + spaceCode}&status=~Closed%2C~Cancelled&module=&entityCode=&type=reactive';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAraMahalDetayBakimIsEmri(spaceCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getWorkorderFromCode&username=' + userName.toString() + '&spaceCode=' + spaceCode}&status=~Closed%2C~Cancelled&module=submaintenance&entityCode=&type=';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaMahalDetaySlaApi(spaceCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getIssuesFromCode&username=' + userName.toString() + '&spaceCode=' + spaceCode}&parentStatus=openParentStatus&cmdbCode=';
    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaMahalDetaySummaryApi(spaceCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '$ServiceTools.baseUrlV1$ServiceTools.tokenV1$deviceId&action=getSpaceDetail&username=$userName&spaceCode=' +
            spaceCode;
    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      //print(response);
      if (response.data['result'] == 'success') {
        return response.data['detail'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

  Future mahalAraVarlikDetayAnlikIsEmri(entityCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getWorkorderFromCode&username=' + userName.toString() + '&entityCode=' + entityCode}&status=~Closed%2C~Cancelled&module=&spaceCode=&type=reactive';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAraVarlikDetayBakimIsEmri(spaceCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getWorkorderFromCode&username=' + userName.toString() + '&entityCode=' + spaceCode}&status=~Closed%2C~Cancelled&module=submaintenance&spaceCode=&type=';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaVarlikDetaySlaApi(cmdbCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1 + ServiceTools.tokenV1 + deviceId + '&action=getIssuesFromCode&username=' + userName.toString() + '&cmdbCode=' + cmdbCode}&parentStatus=openParentStatus&spaceCode=';
    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
      // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaVarlikDetaySummaryApi(caseNo) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    String url =
        // ignore: prefer_interpolation_to_compose_strings
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getEntityDetail&username=$userName&case_no=' +
            caseNo;
    try {
      BaseOptions options = BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(url);

      if (response.data['result'] == 'success') {
        return response.data['detail'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaListesiApi(
    mahalKodu,
    mahalAdi,
    binaKodu,
    katKodu,
    kanatKodu,
    sinifKodu,
    grupKodu,
    dataSayisi,
    sayfa,
  ) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    int limitStart = dataSayisi * (sayfa - 1);
    int limitEnd = dataSayisi * sayfa;

    String mahalAramaListesiUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getSpace&username=$userName&spaceCode=$mahalKodu&spaceName=$mahalAdi&buildingCode=$binaKodu&floorCode=$katKodu&blockCode=$kanatKodu&spaceClass=$sinifKodu&groupNo=$grupKodu&limitStart=$limitStart&limitEnd=$limitEnd';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaListesiUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaListesiUrl);

      //print(response);
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return [];
      }
      //print(response);
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaKampus() async {
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String mahalAramaKampusUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getBuildings';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaKampusUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaKampusUrl);
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaBina(String buildingCode) async {
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String mahalAramaBinaUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getFloors&buildingCode=$buildingCode';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaBinaUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaBinaUrl);
      //print(response.data['records'][0]);∂
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaKat(String floorCode) async {
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String mahalAramaBinaUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getBlocks&floorCode=$floorCode';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaBinaUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaBinaUrl);
      //print(response.data['records']);
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaKanat(String blockCode) async {
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String mahalAramaBinaUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getSpaces&blockCode=$blockCode';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaBinaUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaBinaUrl);
      if (response.data['result'] == 'success') {
        return response.data['records'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  Future mahalAramaGrup() async {
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String mahalAramaGrupUrl =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getGroups';

    try {
      BaseOptions options = BaseOptions(
          baseUrl: mahalAramaGrupUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60) // 60 seconds
          );

      Dio dio = Dio(options);
      final response = await dio.get(mahalAramaGrupUrl);

      if (response.data['result'] == 'success') {
        //print(response.data['records']);
        return response.data['records'];
      } else {
        return false;
      }
    // ignore: deprecated_member_use
    } on DioError {
      return 'Bağlantı Zaman Aşımına Uğradı Lütfen Ağınızı Kontrol Ediniz';
    }
  }

  @override
  Future<Either<int, CustomServiceException>> checkIssueByAuth(
      String issueCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=checkIssueByAuthorizedServices&issueCode=$issueCode&username=$userName';
    try {
      final response = await dio.get(url,
          options: Options(
            responseType: ResponseType.json,
          ));

      super.logger.i(response);
      return Left(int.parse(response.data['count'].toString()));
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  Future<Either<int, CustomServiceException>>
      checkWorkorderByAuthorizedServices(String woCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=checkWorkorderByAuthorizedServices&workorderCode=$woCode&username=$userName';
    try {
      final response = await dio.get(url,
          options: Options(
            responseType: ResponseType.json,
          ));

      final data = response.data['result'];
      super.logger.i(data);
      return Left(int.parse(response.data['count'].toString()));
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<WorkOrderAssetSearchList>, CustomServiceException>>
      assetSearchList(
          String entityCode,
          String seriNo,
          String rfid,
          String typeCode,
          String brandCode,
          String modelCode,
          String locCode,
          String limitStart,
          String limitEnd) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    //http://10.126.12.21/esh/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wdeshtest!_6BCFD9E7-75A8-4688-8E85-10C5E2B4A96E&action=getEntity&username=sgnm1031&case_no=&serino=&rfid=&serviceCode=&typeCode=&defnCode=&brand=&model=&mahalno=A-BK(T)-027&limitStart=1&limitEnd=20
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=getEntity&username=$userName&case_no=$entityCode&serino=$seriNo&rfid=$rfid&serviceCode=&typeCode=$typeCode&defnCode=&brand=$brandCode&model=$modelCode&mahalno=$locCode&limitStart=$limitStart&limitEnd=$limitEnd';
    try {
      final response = await dio.get(url,
          options: Options(
            responseType: ResponseType.json,
          ));
      final data = response.data;

      List<WorkOrderAssetSearchList> assetSearchListPage =
          WorkOrderAssetSearchList.fromJsonList(data['records']);
      super.logger.i(assetSearchListPage);
      return Left(assetSearchListPage);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }
}
