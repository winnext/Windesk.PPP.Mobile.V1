import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_available_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_time_model.dart';
import '../../../../feature/models/issue_models/issue_tracing_list_model.dart';

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
  Future<Either<IssueSummaryModel, CustomServiceException>> getIssueSummary(String issueCode);
  Future<Either<IssueSummaryTimeModel, CustomServiceException>> getIssueTimeInfo(String issueCode);
  Future<Either<List<IssueActivitiesModel>, CustomServiceException>> getIssueActivities(String issueCode);
  Future<Either<List<IssueAttachmentsModel>, CustomServiceException>> getIssueAttachment(String issueCode);
  Future<Either<List<IssueAvailableActivities>, CustomServiceException>> getAvailableActivities(String issueCode);
  Future<Either<IssueOperationList, CustomServiceException>> getIssueOperations(String issueCode);
  Future<Either<bool, CustomServiceException>> addIssueAttachmentMethod(
      String userToken, String userName, String issueCode, String image, String desc);
  Future<Either<bool, CustomServiceException>> takeOverIssue(
      String userToken, String userName, String issueCode);

}
