import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_tracing_list_model.dart';

import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/log/log_manager.dart';
import '../../../../feature/models/issue_models/issue_list_model.dart';
import '../../../../feature/service/service_manager.dart';

abstract class IssueServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // TEST METHODS
  Future<Either<List<IssueTracingListModel>, CustomServiceException>> getIssueTracingList();
  Future<Either<List<IssueListModel>, CustomServiceException>> getIssueList(Map<String, dynamic> queryParameters, String issueListType);
}
