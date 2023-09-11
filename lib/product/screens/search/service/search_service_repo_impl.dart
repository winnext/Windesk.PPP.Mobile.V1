import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_asset_search_list_model.dart';
import 'package:wm_ppp_4/product/screens/search/service/search_service_repo.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';

class SearchServiceRepoImpml extends SearchServiceRepository {
  @override
  Future<Either<bool, CustomServiceException>> checkIssueByAuth(
      String issueCode) async {
    final String userName =
        await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url =
        '${ServiceTools.baseUrlV1}$deviceId&action=checkIssueByAuthorizedServices&issueCode=$issueCode&username=$userName';
    try {
      final response = await dio.get(url,
          options: Options(
            responseType: ResponseType.json,
          ));

      final data = response.data['result'];
      super.logger.i(data);
      return Left(data);
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
