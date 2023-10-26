// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../constants/paths/service_tools.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/auth_models/check_access_token_model.dart';

import '../../../models/auth_models/login_model.dart';

import '../../../database/shared_manager.dart';
import '../../../enums/service_response_status_enums.dart';
import '../../../enums/shared_enums.dart';
import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  @override
  Future<Either<LoginModel, CustomServiceException>> login(String username, String password) async {
    final String deviceId = await SharedManager().getString(SharedEnum.deviceId);
    final String deviceType = await SharedManager().getString(SharedEnum.deviceType);
    final String firebaseToken = await SharedManager().getString(SharedEnum.firebaseToken);
    @override
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=loginCheck&username=$username&password=$password&platform=$deviceType&version=3&mobileV2=true';
    try {
      final response = await super.dio.get(
            url,
            options: Options(),
          );

      final data = response.data;
      String action = deviceType == 'ios' ? 'addIOSToken' : 'addFireBaseToken';
      String sendFirebaseTokenUrl =
          '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&username=$username&platform=$deviceType&action=$action&firebasetoken=$firebaseToken';

      final responseSendFirebaseTokenUrl = await super.dio.get(
            sendFirebaseTokenUrl,
            options: Options(),
          );
      LoginModel loginModel = LoginModel.fromJson(data);
      super.logger.i(loginModel);

      return Left(loginModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> logout(String username) async {
    final String deviceId = await SharedManager().getString(SharedEnum.deviceId);

    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceId&action=logout&username=$username';

    try {
      final response = await super.dio.get(
            url,
            options: Options(),
          );
      final data = response.data;
      super.logger.i(data);
      if (data[ServiceResponseStatusEnums.result.rawText] == 'success') {
        super.logger.i('logout success');
        return const Left(true);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.logoutError, statusCode: '400'));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.logoutError, statusCode: '400'));
    }
  }

  @override
  Future<Either<CheckAccesTokenModel, CustomServiceException>> checkAccessToken(String token) async {
    String url = 'http://localhost:3012/user/checkAccessToken';

    try {
      final response = await super.dio.post(url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
            sendTimeout: const Duration(seconds: 4),
            receiveTimeout: const Duration(seconds: 4),
            responseType: ResponseType.json,
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        CheckAccesTokenModel checkAccesTokenModel = CheckAccesTokenModel.fromJson(data);

        return Left(checkAccesTokenModel);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
    }
  }
}
