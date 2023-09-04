import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/product/screens/search/service/search_service_repo.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';

class SearchServiceRepoImpml extends SearchServiceRepository {
  @override
  Future<Either<bool, CustomServiceException>> checkIssueByAuth(String issueCode) async {
    final String userName = await SharedManager().getString(SharedEnum.userCode);
    String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url = '${ServiceTools.baseUrlV1}$deviceId&action=checkIssueByAuthorizedServices&issueCode=$issueCode&username=$userName';
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
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }
}
