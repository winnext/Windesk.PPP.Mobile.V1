import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/issue_models/issue_tracing_list_model.dart';
import 'package:vm_fm_4/product/screens/issue/service/issue_service_repo.dart';

import '../../../../feature/constants/paths/service_tools.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';

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
      return Left(tracingList);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }
}
