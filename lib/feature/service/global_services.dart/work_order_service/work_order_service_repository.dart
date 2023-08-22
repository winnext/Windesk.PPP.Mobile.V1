import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_list_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_store_product_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_store_product_package_info_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_tracing_list_model.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../../models/work_order_models/work_order_added_resources_model.dart';
import '../../../models/work_order_models/work_order_attachments_model.dart';
import '../../../models/work_order_models/work_order_date_action_model.dart';
import '../../../models/work_order_models/work_order_details_model.dart';
import '../../../models/work_order_models/work_order_loads_model.dart';
import '../../../models/work_order_models/work_order_resources_model.dart';
import '../../../models/work_order_models/work_order_shiftings_model.dart';
import '../../../models/work_order_models/work_order_spareparts_model.dart';
import '../../../models/work_order_models/work_order_stores_model.dart';
import '../../service_manager.dart';

abstract class WorkOrderServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // GET WORK ORDER TRACING LIST
  Future<Either<List<WorkOrderTracingListModel>, CustomServiceException>> getWorkOrderTracingList(String xuserCode);

  Future<Either<List<WorkOrderListModel>, CustomServiceException>> getWorkOrderList(
    String xuserCode,
    String workOrderCode,
    String startLimit,
    String endLimit,
    String build,
    String floor,
    String responsible,
    String status,
  );

  // GET WORK ORDER METHODS
  Future<Either<List<WorkOrderLoadsModel>, CustomServiceException>> getWorkOrderLoads(String userId, String workOrderCode);

  Future<Either<List<WorkOrderAttachmentsModel>, CustomServiceException>> getWorkOrderAttachments(String workOrderCode);

  Future<Either<List<WorkOrderResourcesModel>, CustomServiceException>> getWorkOrderResources(String workOrderCode);

  Future<Either<List<WorkOrderShiftingsModel>, CustomServiceException>> getWorkOrderShiftings(String userToken);

  Future<Either<WorkOrderDetailsModel, CustomServiceException>> getWorkOrderDetails(String userCode, String workOrderCode);

  Future<Either<List<WorkOrderSparepartsModel>, CustomServiceException>> getWorkOrderSpareparts(String userName, String workOrderCode);

  Future<Either<WorkOrderDateActionModel, CustomServiceException>> getWorkOrderDateAction(String workOrderCode, String actionType);

  Future<Either<List<WorkOrderStores>, CustomServiceException>> getWorkOrderStores(String userToken, String userName);

  Future<Either<List<WorkOrderStoreProductModel>, CustomServiceException>> getWorkOrderStoreProducts(String userToken, String storeCode);

  Future<Either<List<WorkOrderStoreProductPackageInfoModel>, CustomServiceException>> getWorkOrderStoreProductPackageInfo(
    String userToken,
    String productCode,
  );

  Future<Either<List<WorkOrderAddedResources>, CustomServiceException>> getWorkOrderAddedResources(String userToken, String serviceCode);

  // ADD WORK ORDER METHODS
  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(String userToken, String workOrderCode, String userName, String workPeriod);

  Future<Either<bool, CustomServiceException>> addWorkOrderPersonal(String workOrderCode, String moduleCode, String tuwnofWork);

  Future<Either<bool, CustomServiceException>> addWorkOrderImage(String workOrderCode, String image, String desc);

  Future<Either<bool, CustomServiceException>> addWorkOrderSpareparts(
    String userToken,
    String workOrderCode,
    String product,
    String amount,
    String unit,
  );

  // DELETE WORK ORDER METHODS
  Future<Either<bool, CustomServiceException>> deleteWorkOrderSpareparts(String workOrderCode);

  Future<Either<bool, CustomServiceException>> deleteWorkOrderPersonal(String workOrderCode, String moduleCode);

  Future<Either<bool, CustomServiceException>> deleteWorkOrderEffort(String workOrderCode);
}
