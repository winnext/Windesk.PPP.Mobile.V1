import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_attachments_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_loads_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_resources_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_spareparts_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderDetailAccordionProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool userClickedEfforts = false;
  bool userFetchedEfforts = false;

  bool userCLickedPersonals = false;
  bool userFetchedPersonals = false;

  bool userClickedMaterials = false;
  bool userFetchedMaterials = false;

  bool userClickedDocumants = false;
  bool userFetchedDocumants = false;

  bool successDeleted = false;
  bool errorAccur = false;

  bool isLoading = false;

  List<WorkOrderLoadsModel> loads = [];
  List<WorkOrderSparepartsModel> spareparts = [];
  List<WorkOrderResourcesModel> resources = [];
  List<WorkOrderAttachmentsModel> attachments = [];

  void update() {
    notifyListeners();
  }

  void setUserClickedEfforts() {
    userClickedEfforts = true;
  }

  void setUserClickedPersonals() async {
    userCLickedPersonals = true;
  }

  void setUserClickedMaterials() async {
    userClickedMaterials = true;
  }

  void setUserClickedDocumants() async {
    userClickedDocumants = true;
  }

  void deleteResource(String workOrderCode, String resourceCode) async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.deleteWorkOrderPersonal(userToken, userCode, workOrderCode, resourceCode);

    response.fold(
      (l) => {
        l ? successDeleted = true : errorAccur = true,
      },
      (r) => {
        errorAccur = true,
      },
    );

    notifyListeners();
    _setValues();
  }

  void deleteSparepart(String materialCode) async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.deleteWorkOrderSpareparts(userToken, userCode, materialCode);

    response.fold(
      (l) => {
        l ? successDeleted = true : errorAccur = true,
      },
      (r) => {
        errorAccur = true,
      },
    );

    notifyListeners();
    _setValues();
  }

  void deleteEffort(String effortCode) async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final String userCode = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.deleteWorkOrderEffort(userToken, userCode, effortCode);

    response.fold(
      (l) => {
        l ? successDeleted = true : errorAccur = true,
      },
      (r) => {
        errorAccur = true,
      },
    );
    notifyListeners();
    _setValues();
  }

  void fetchEffortList(String workOrderCode) async {
    if (!userFetchedEfforts) {
      isLoading = true;
      notifyListeners();

      String userId = await SharedManager().getString(SharedEnum.userName);
      final response = await _service.getWorkOrderLoads(userId, workOrderCode);
      response.fold(
        (l) => {
          loads = l,
        },
        (r) => {
          loads = [],
        },
      );
      isLoading = false;
      userFetchedEfforts = true;
      notifyListeners();
    }
  }

  void fetchMaterialList(String workOrderCode) async {
    if (!userFetchedMaterials) {
      isLoading = true;
      notifyListeners();

      String userId = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.getWorkOrderSpareparts(userId, workOrderCode);

      response.fold(
        (l) => {
          spareparts = l,
        },
        (r) => {
          spareparts = [],
        },
      );

      isLoading = false;
      userFetchedMaterials = true;
      notifyListeners();
    }
  }

  void fetchResourcesList(String workOrderCode) async {
    if (!userFetchedPersonals) {
      isLoading = true;
      notifyListeners();

      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.getWorkOrderResources(userCode, workOrderCode);

      response.fold(
        (l) => {
          resources = l,
        },
        (r) => {
          resources = [],
        },
      );
      isLoading = false;
      userFetchedPersonals = true;
      notifyListeners();
    }
  }

  void fetchDocumantsList(String workOrderCode) async {
    if (!userFetchedDocumants) {
      isLoading = true;
      notifyListeners();

      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.getWorkOrderAttachments(userCode, workOrderCode);

      response.fold(
        (l) => {
          attachments = l,
        },
        (r) => {
          attachments = [],
        },
      );
    }
    isLoading = false;
    userFetchedDocumants = true;
    notifyListeners();
  }

  void _setValues() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        successDeleted = false;
        errorAccur = false;
      },
    );
  }
}
