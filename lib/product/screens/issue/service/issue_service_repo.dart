import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_available_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_groups_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_users_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_filter_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_filter_status_model.dart';
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
  Future<Either<List<IssueAvailableActivities>, CustomServiceException>> getAvailableActivities(String issueCode,String userToken);
  Future<Either<IssueOperationList, CustomServiceException>> getIssueOperations(String issueCode);
  Future<Either<bool, CustomServiceException>> addIssueAttachmentMethod(
      String userToken, String userName, String issueCode, String image, String desc);
  Future<Either<bool, CustomServiceException>> takeOverIssue(
      String userToken, String userName, String issueCode);
  Future<Either<bool, CustomServiceException>> createSparepartIssue(
      String userToken, String issueCode);
  Future<Either<bool, CustomServiceException>> cancelIssuePlanned(
      String userToken, String userName, String issueCode);
  Future<Either<List<LiveSelectAsgGroupsModel>, CustomServiceException>> getLiveSelectAsgGroups(String issueCode,String userToken);
  Future<Either<List<LiveSelectAsgUsersModel>, CustomServiceException>> getLiveSelectAsgUser(String issueCode,String userToken,String asgGroupCode);
  Future<Either<bool, CustomServiceException>> saveIssueActivity(String issueCode,String userToken,String asgGroupCode,String username,String activityCode,
    String description,
    String locationCode,
    String asgUserCode,
    String additionalTime,
    String module,
    String image,String patientNo, String sampleNo);
  Future<Either<bool, CustomServiceException>> changeCfg(
       String userToken, String issueCode, String cfgCode);
  Future<Either<List<IssueFilterModel>, CustomServiceException>> getSpaceBfwByType(String type,String userToken);
  Future<Either<List<IssueFilterStatusModel>, CustomServiceException>> getIssueOpenStatusCodes(String userToken);
}
