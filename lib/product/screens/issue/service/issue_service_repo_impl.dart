import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

    final String userCode = await SharedManager().getString(SharedEnum.userToken);

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

    final String userCode = await SharedManager().getString(SharedEnum.userToken);

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
}
