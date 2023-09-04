import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wm_ppp_4/feature/enums/building_type_enums.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_buildings_and_floors_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_change_state_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_status_model.dart';

import '../../../constants/paths/service_tools.dart';
import '../../../enums/service_response_status_enums.dart';
import '../../../enums/service_status_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/work_order_models/work_order_added_resources_model.dart';
import '../../../models/work_order_models/work_order_attachments_model.dart';
import '../../../models/work_order_models/work_order_date_action_model.dart';
import '../../../models/work_order_models/work_order_details_model.dart';
import '../../../models/work_order_models/work_order_list_model.dart';
import '../../../models/work_order_models/work_order_loads_model.dart';
import '../../../models/work_order_models/work_order_resources_model.dart';
import '../../../models/work_order_models/work_order_shiftings_model.dart';
import '../../../models/work_order_models/work_order_spareparts_model.dart';
import '../../../models/work_order_models/work_order_store_product_model.dart';
import '../../../models/work_order_models/work_order_store_product_package_info_model.dart';
import '../../../models/work_order_models/work_order_stores_model.dart';
import '../../../models/work_order_models/work_order_tracing_list_model.dart';
import 'work_order_service_repository.dart';

class WorkOrderServiceRepositoryImpl extends WorkOrderServiceRepository {
  // Change Work Order Status
  @override
  Future<Either<WorkOrderChangeStateModel, CustomServiceException>> changeWorkOrderStatus(
      String userToken, String userName, String workOrderCode, String status) async {
    WorkOrderChangeStateModel model;

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=workorderActualDateActions&workorderCode=$workOrderCode&username=$userName&type=$status&nfc=0&workorder_wait_reason=&workorder_wait_reasoncode=';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == true) {
        model = WorkOrderChangeStateModel(
          result: response.data[ServiceResponseStatusEnums.result.rawText],
          message: response.data['uyari'],
        );

        super.logger.e(model);

        return Left(model);
      } else {
        return Right(
          CustomServiceException(
            message: CustomServiceMessages.workOrderDeleteSparepartsError,
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: '500'));
    }
  }

  // GET SERVICES
  @override // efforts
  Future<Either<List<WorkOrderLoadsModel>, CustomServiceException>> getWorkOrderLoads(String userId, String workOrderCode) async {
    List<WorkOrderLoadsModel> loads = [];
    String url = '${ServiceTools.baseUrlV2}/workorder/$workOrderCode/workloads';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {
              'xusercode': userId,
              'xtoken': ServiceTools.tokenV2,
            },
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        loads = const WorkOrderLoadsModel().fromJsonList(data);

        return Left(loads);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderAttachmentsModel>, CustomServiceException>> getWorkOrderAttachments(String userCode, String workOrderCode) async {
    List<WorkOrderAttachmentsModel> attachments = [];
    String url = '${ServiceTools.baseUrlV2}/workorder/$workOrderCode/attachments';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': userCode, 'xtoken': ServiceTools.tokenV2},
          ));
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        attachments = const WorkOrderAttachmentsModel().fromJsonList(data);

        return Left(attachments);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAttachmentsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAttachmentsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderResourcesModel>, CustomServiceException>> getWorkOrderResources(String userCode, String workOrderCode) async {
    List<WorkOrderResourcesModel> resources = [];
    String url = '${ServiceTools.baseUrlV2}/workorder/$workOrderCode/resources';
    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': userCode, 'xtoken': ServiceTools.tokenV2},
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        resources = WorkOrderResourcesModel.fromJsonList(data);
        return Left(resources);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderResourcesError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderResourcesError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderShiftingsModel>, CustomServiceException>> getWorkOrderShiftings(String userToken) async {
    List<WorkOrderShiftingsModel> shiftings = [];

    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getVardiyas';
    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];

        shiftings = WorkOrderShiftingsModel.fromJsonList(data);

        return Left(shiftings);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderShiftingsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderShiftingsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkOrderDetailsModel, CustomServiceException>> getWorkOrderDetails(String userCode, String workOrderCode) async {
    WorkOrderDetailsModel workOrderDeatails;
    String url = '${ServiceTools.baseUrlV2}/workorder/detail/$workOrderCode';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {
              'xusercode': userCode,
              'xtoken': ServiceTools.tokenV2,
            },
          ));
      super.logger.e(response);

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.detail.rawText];
        workOrderDeatails = WorkOrderDetailsModel.fromJson(data);

        super.logger.d(workOrderDeatails.toString());

        return Left(workOrderDeatails);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDetailsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDetailsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderSparepartsModel>, CustomServiceException>> getWorkOrderSpareparts(String userName, String workOrderCode) async {
    List<WorkOrderSparepartsModel> spareparts = [];
    String url = '${ServiceTools.baseUrlV2}/workorder/$workOrderCode/spareparts';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': userName, 'xtoken': ServiceTools.tokenV2},
          ));

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        spareparts = WorkOrderSparepartsModel.fromJsonList(data);

        return Left(spareparts);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderSparepartsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderSparepartsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkOrderDateActionModel, CustomServiceException>> getWorkOrderDateAction(String workOrderCode, String actionType) async {
    WorkOrderDateActionModel dateAction;
    String url =
        'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=wddemo!_null&action=workorderActualDateActions&workorderCode=$workOrderCode&username=sgnm1040&type=$actionType&nfc=0&workorder_wait_reason=&workorder_wait_reasoncode=';
    try {
      final response = await super.dio.get(url);
      if (response.statusCode == 200) {
        dateAction = WorkOrderDateActionModel.fromJson(response.data);

        return Left(dateAction);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDateActionError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDateActionError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderStores>, CustomServiceException>> getWorkOrderStores(String userToken, String userName) async {
    List<WorkOrderStores> stores;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getStore&user=$userName';

    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        stores = WorkOrderStores.fromJsonList(data);

        return Left(stores);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderStoreProductModel>, CustomServiceException>> getWorkOrderStoreProducts(String userToken, String storeCode) async {
    List<WorkOrderStoreProductModel> storeProducts;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getProduct&storagecode=$storeCode';

    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        storeProducts = WorkOrderStoreProductModel.fromJsonList(data);

        return Left(storeProducts);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderStoreProductPackageInfoModel>, CustomServiceException>> getWorkOrderStoreProductPackageInfo(
    String userToken,
    String productCode,
  ) async {
    List<WorkOrderStoreProductPackageInfoModel> productPackages;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getPackageInfoByProduct&productDefCode=$productCode';

    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        productPackages = WorkOrderStoreProductPackageInfoModel.fromJsonList(data);

        return Left(productPackages);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderStoresError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderAddedResources>, CustomServiceException>> getWorkOrderAddedResources(String userToken, String serviceCode) async {
    List<WorkOrderAddedResources> addedResources;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getResponsible&service=$serviceCode';
    try {
      final response = await super.dio.get(url);
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];
        addedResources = WorkOrderAddedResources.fromJsonList(data);

        return Left(addedResources);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddedResourcesError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddedResourcesError, statusCode: '500'));
    }
  }

  // ADD SERVICES
  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(String userToken, String workOrderCode, String userName, String workPeriod) async {
    bool result = false;

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addWorkorderEffort&workordercode=$workOrderCode&username=$userName&module=workorder&workperiod=$workPeriod&startdate=1&type=PREDICTED&description=test';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderAttachment(
    String userToken,
    String userName,
    String workOrderCode,
    String image,
    String desc,
  ) async {
    bool result = false;
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addAttachment&username=$userName&moduleName=workorder&issueCode=$workOrderCode';

    FormData formData = FormData.fromMap({"base64string": image, 'description': desc});
    try {
      final response = await super.dio.post(url, data: formData);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

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
  Future<Either<bool, CustomServiceException>> addWorkOrderPersonal(
      String userToken, String workOrderCode, String moduleCode, String tuwnofWork) async {
    bool result = false;
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addResourceStaff&module=xusr&modulecode=$moduleCode&workordercode=$workOrderCode&turnofwork=$tuwnofWork';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderSpareparts(
    String userToken,
    String workOrderCode,
    String product,
    String amount,
    String unit,
  ) async {
    bool result = false;

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=addMaterial&module=stproductdef&modulecode=$product&workordercode=$workOrderCode&amount=$amount&unit=$unit';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddSparepartsError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddSparepartsError, statusCode: '500'));
    }
  }

  // DELETE SERVICES
  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderEffort(String userToken, String userName, String effortCode) async {
    bool result = false;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=deleteWorkorderWorklog&code=$effortCode&username=$userName';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteEffortError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteEffortError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderPersonal(
    String userToken,
    String userName,
    String workOrderCode,
    String moduleCode,
  ) async {
    bool result = false;
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=deleteWorkorderResource&username=$userName&module=xusr&moduleCode=$moduleCode&workorderCode=$workOrderCode';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeletePersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeletePersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> deleteWorkOrderSpareparts(String userToken, String userName, String materialCode) async {
    bool result = false;
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=deleteWorkorderSparepart&code=$materialCode&username=$userName';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(
          CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: response.statusCode.toString()),
        );
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> deteleteWorkOrderDocumant(String userToken, String userName, String documantId) async {
    bool result = false;
    // String url = '';
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=deleteWorkorderAttachment&username=$userName&id=$documantId';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(
          CustomServiceException(
            message: CustomServiceMessages.workOrderDeleteSparepartsError,
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderDeleteSparepartsError, statusCode: '500'));
    }
  }

  // GET WORK ORDER SERVICES
  @override
  Future<Either<List<WorkOrderTracingListModel>, CustomServiceException>> getWorkOrderTracingList(String xuserCode) async {
    String url = '${ServiceTools.baseUrlV2}/list/module/workorder';

    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {
                'xusercode': xuserCode,
                'xtoken': ServiceTools.tokenV2,
              },
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
          final data = response.data;

          List<WorkOrderTracingListModel> tracingList = WorkOrderTracingListModel.fromJsonList(data['lists']);
          super.logger.e(tracingList.toString());

          return Left(tracingList);
        } else {
          return Right(CustomServiceException(message: 'Work Order Tracing List Model Error', statusCode: '500'));
        }
      } else {
        return Right(CustomServiceException(message: 'Work Order Tracing List Model Error', statusCode: '500'));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: 'Work Order Tracing List Model Error', statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderListModel>, CustomServiceException>> getWorkOrderList(
    String xuserCode,
    String workOrderCode,
    String startLimit,
    String endLimit,
    String build,
    String floor,
    String responsible,
    String status,
  ) async {
    String url =
        '${ServiceTools.baseUrlV2}/list/$workOrderCode/workorder?start=$startLimit&end=$endLimit&build=$build&floor=$floor&responsible&status=$status';

    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {
                'xusercode': xuserCode,
                'xtoken': ServiceTools.tokenV2,
              },
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
          final data = response.data;

          List<WorkOrderListModel> workOrderList = WorkOrderListModel.fromJsonList(data['records']);
          super.logger.e(workOrderList.toString());

          return Left(workOrderList);
        } else {
          return Right(CustomServiceException(message: 'Work Order List Model Error', statusCode: '500'));
        }
      } else {
        return Right(CustomServiceException(message: 'Work Order List Model Error', statusCode: '500'));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: 'Work Order List Model Error', statusCode: '500'));
    }
  }

  // FILTER SERVICES
  @override
  Future<Either<List<WorkOrderBuildingsAndFloorsModel>, CustomServiceException>> getWorkOrderBuildingsAndFloors(
    String userToken,
    BuildingTypeEnums buildingType,
  ) async {
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getSpaceBfwByType&type=${buildingType.rawValue}';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];

        List<WorkOrderBuildingsAndFloorsModel> buildings = WorkOrderBuildingsAndFloorsModel.fromJsonList(data);

        return Left(buildings);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderStatusModel>, CustomServiceException>> getWorkOrderStatus(String userToken) async {
    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=getWorkorderStatuses';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data[ServiceResponseStatusEnums.records.rawText];

        List<WorkOrderStatusModel> status = WorkOrderStatusModel.fromJsonList(data);

        return Left(status);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> getWorkOrderDetailsByCode(String userToken, String workOrderCode, String userName) async {
    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=checkWorkorderByAuthorizedServices&workorderCode=$workOrderCode&username=$userName';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());
      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
        return const Left(true);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddPersonalError, statusCode: '500'));
    }
  }
}
