import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/log/log_manager.dart';
import '../../../../feature/service/service_manager.dart';

abstract class SearchServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // TEST METHODS
  Future<Either<bool, CustomServiceException>> checkIssueByAuth(String issueCode);

}
