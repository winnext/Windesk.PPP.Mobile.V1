import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_asset_search_list_model.dart';

import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/log/log_manager.dart';
import '../../../../feature/service/service_manager.dart';

abstract class SearchServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // TEST METHODS
  Future<Either<int, CustomServiceException>> checkIssueByAuth(
      String issueCode);
  Future<Either<List<WorkOrderAssetSearchList>, CustomServiceException>>
      assetSearchList(
          String entityCode,
          String seriNo,
          String rfid,
          String typeCode,
          String brandCode,
          String modelCode,
          String locCode,
          String limitStart,
          String limitEnd);
}
