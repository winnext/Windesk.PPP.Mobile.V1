import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/enums/service_response_status_enums.dart';
import 'package:wm_ppp_4/feature/enums/service_status_enums.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_available_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_groups_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_users_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_time_model.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/models/issue_models/issue_tracing_list_model.dart';
import 'issue_service_repo.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';
import '../../../../feature/models/issue_models/issue_list_model.dart';

class IssueServiceRepoImpml extends IssueServiceRepository {
  @override
  Future<Either<List<IssueTracingListModel>, CustomServiceException>> getIssueTracingList() async {
    List<IssueTracingListModel> tracingList = [];

    final String userCode = await SharedManager().getString(SharedEnum.userCode);

    String url = '${ServiceTools.baseUrlV2}/list/module/issue';

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data['lists'];
      tracingList = IssueTracingListModel.fromJsonList(data);
      super.logger.i(tracingList);
      return Left(tracingList);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<IssueListModel>, CustomServiceException>> getIssueList(Map<String, dynamic> queryParameters, String issueListType) async {
    List<IssueListModel> issueList = [];

    final String userCode = await SharedManager().getString(SharedEnum.userCode);

    String url = '${ServiceTools.baseUrlV2}/list/$issueListType/issue';

    try {
      final response =
          await dio.get(url, queryParameters: queryParameters, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data['records'];
      issueList = IssueListModel.fromJsonList(data);
      super.logger.i(issueList);
      return Left(issueList);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<IssueSummaryModel, CustomServiceException>> getIssueSummary(String issueCode) async {
    String url = '${ServiceTools.baseUrlV2}/issue/$issueCode';
    final String userCode = await SharedManager().getString(SharedEnum.userCode);

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data[ServiceResponseStatusEnums.detail.rawText];

      IssueSummaryModel issueSummary = IssueSummaryModel.fromJson(data);
      super.logger.i(issueSummary);
      return Left(issueSummary);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<IssueSummaryTimeModel, CustomServiceException>> getIssueTimeInfo(String issueCode) async {
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    String url = '${ServiceTools.baseUrlV2}/issue/$issueCode/summary';

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data[ServiceResponseStatusEnums.detail.rawText];

      IssueSummaryTimeModel issueSummaryTimeInfo = IssueSummaryTimeModel.fromJson(data);
      super.logger.i(issueSummaryTimeInfo);
      return Left(issueSummaryTimeInfo);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<IssueActivitiesModel>, CustomServiceException>> getIssueActivities(String issueCode) async {
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    String url = '${ServiceTools.baseUrlV2}/issue/$issueCode/activities';
    List<IssueActivitiesModel> issueActivitiesModel;

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      issueActivitiesModel = IssueActivitiesModel.fromJsonList(data);
      super.logger.i(issueActivitiesModel);
      return Left(issueActivitiesModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<IssueAttachmentsModel>, CustomServiceException>> getIssueAttachment(String issueCode) async {
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    String url = '${ServiceTools.baseUrlV2}/issue/$issueCode/attachments';
    List<IssueAttachmentsModel> issueAttachmentsModel;

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      issueAttachmentsModel = IssueAttachmentsModel.fromJsonList(data);
      super.logger.i(issueAttachmentsModel);
      return Left(issueAttachmentsModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<IssueAvailableActivities>, CustomServiceException>> getAvailableActivities(String issueCode, String userToken) async {
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getAvailableActivities&issueCode=$issueCode&module=issue';
    List<IssueAvailableActivities> issueAttachmentsModel;

    try {
      final response = await dio.get(url);
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      issueAttachmentsModel = IssueAvailableActivities.fromJsonList(data);
      super.logger.i(issueAttachmentsModel);
      return Left(issueAttachmentsModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<IssueOperationList, CustomServiceException>> getIssueOperations(String issueCode) async {
    String url = '${ServiceTools.baseUrlV2}/issue/$issueCode/operationList';
    final String userCode = await SharedManager().getString(SharedEnum.userCode);

    try {
      final response = await dio.get(url, options: Options(headers: {"xusercode": userCode, "xtoken": ServiceTools.tokenV2}));
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      IssueOperationList issueOperations = IssueOperationList.fromJson(data);
      super.logger.i(issueOperations);
      return Left(issueOperations);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addIssueAttachmentMethod(
    String userToken,
    String userName,
    String issueCode,
    String image,
    String desc,
  ) async {
    bool result = false;
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addAttachment&issueCode=$issueCode&username=$userName&moduleName=issue';

    FormData formData = FormData.fromMap({"base64string": image, 'description': desc});
    try {
      final response = await super.dio.post(url, data: formData);
      super.logger.i(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;
        super.logger.i(result.toString());
        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> takeOverIssue(
    String userToken,
    String userName,
    String issueCode,
  ) async {
    bool result = false;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=takeOverIssue&issueCode=$issueCode&username=$userName';

    try {
      final response = await super.dio.get(url);
      super.logger.i(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;
        super.logger.i(result.toString());
        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.takeOverIssue, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.takeOverIssue, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<LiveSelectAsgGroupsModel>, CustomServiceException>> getLiveSelectAsgGroups(String issueCode, String userToken) async {
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getLiveSelectAsgGroups&issueCode=$issueCode';
    List<LiveSelectAsgGroupsModel> liveSelectAsgGroups;

    try {
      final response = await dio.get(url);
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      liveSelectAsgGroups = LiveSelectAsgGroupsModel.fromJsonList(data);
      super.logger.i(liveSelectAsgGroups);
      return Left(liveSelectAsgGroups);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<LiveSelectAsgUsersModel>, CustomServiceException>> getLiveSelectAsgUser(
      String issueCode, String userToken, String asgGroupCode) async {
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getLiveSelectUsers&asgGroupCode=$asgGroupCode';
    List<LiveSelectAsgUsersModel> liveSelectAsgUsers;

    try {
      final response = await dio.get(url);
      final data = response.data[ServiceResponseStatusEnums.records.rawText];

      liveSelectAsgUsers = LiveSelectAsgUsersModel.fromJsonList(data);
      super.logger.i(liveSelectAsgUsers);
      return Left(liveSelectAsgUsers);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> saveIssueActivity(
    issueCode,
    userToken,
    asgGroupCode,
    username,
    activityCode,
    description,
    locationCode,
    asgUserCode,
    additionalTime,
    module,
    image,
  ) async {
    bool result = false;
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addActivity&issueCode=$issueCode&username=$username&activityCode=$activityCode&locationCode=$locationCode&asgGroupCode=$asgGroupCode&asgUserCode=$asgUserCode&additionalTime=$additionalTime&module=issue&from_mobile=1&cardNo='
        '&patientNo='
        '&sampleNo='
        '&description=$description';
    print('url' + url.toString());
    FormData formData = FormData.fromMap({"base64string": image});
    try {
      final response = await super.dio.post(url, data: formData);
      super.logger.i(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;
        super.logger.i(result.toString());
        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddImageError, statusCode: '500'));
    }
  }
}
