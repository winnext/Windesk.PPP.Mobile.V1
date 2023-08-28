// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/product/screens/test/service/test_service_repo.dart';

import '../../../../feature/enums/service_response_status_enums.dart';
import '../../../../feature/enums/service_status_enums.dart';
import '../../../../feature/enums/shared_enums.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';

class TestServiceRepositoryImpl extends TestServiceRepository {
  // TEST SERVICES
  @override
  Future<Either<bool, CustomServiceException>> accessTestWindesk() async {
    bool result = false;

    String url =
        '${ServiceTools.attachPath}?&timestamp=${DateTime.now().millisecondsSinceEpoch.toString()}';
    try {
      final response = await super.dio.get(url);
      super.logger.e(response.statusCode.toString());

      if (response.statusCode.toString() == '200') {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.workOrderAddEffortError,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderAddEffortError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> accessTestMobileService() async {
    bool result = false;

    String url = '${ServiceTools.baseUrlV2}/workorder/reactive';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1031", 'xtoken': ServiceTools.tokenV2},
            responseType: ResponseType.json,
          ));
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] ==
          ServiceStatusEnums.success.rawText) {
        result = true;

        //super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.workOrderAddEffortError,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderAddEffortError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<String, CustomServiceException>> getServerTime(token) async {
    String result = 'false';

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$token&action=getDateTime';
    try {
      final response = await super.dio.get(url,
          options: Options(
            responseType: ResponseType.json,
          ));
      super.logger.e(response.data['records'].toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] ==
          ServiceStatusEnums.success.rawText) {
        result = 'true';

        super.logger.e(result);

        return Left(response.data['records']);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.getServerTimeError,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.getServerTimeError,
          statusCode: '500'));
    }
  }
}
