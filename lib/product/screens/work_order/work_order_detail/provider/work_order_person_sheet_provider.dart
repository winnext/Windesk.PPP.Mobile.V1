import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_added_resources_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_shiftings_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderPersonSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service =
      Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  List<WorkOrderShiftingsModel> shiftings = [];
  List<WorkOrderAddedResources> addedResources = [];
  String userCode = '';
  String userPeriodCode = '';
  bool isSuccess = false;
  bool errorAccur = false;
  bool init = true;
  bool isLoading = false;

  void addPersonal(String workOrderCode) async {
    if (userCode.isEmpty) userCode = addedResources.first.code.toString();
    if (userPeriodCode.isEmpty) {
      userPeriodCode = shiftings.first.code.toString();
    }

    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final response = await _service.addWorkOrderPersonal(
        userToken, workOrderCode, userCode, userPeriodCode);

    response.fold(
      (l) => {
        if (l)
          {
            isSuccess = true,
          }
        else
          {
            errorAccur = true,
          }
      },
      (r) => {
        errorAccur = true,
      },
    );
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        errorAccur = false;
        isSuccess = false;
      },
    );
  }

  void getInfos() async {
    if (init) {
      setLoading();
      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      await getPersonals(userToken, '12');
      await getShiftings(userToken);
      init = false;
      setLoading();
      notifyListeners();
    }
  }

  Future<void> getShiftings(String userToken) async {
    final response = await _service.getWorkOrderShiftings(userToken);

    response.fold(
      (l) => {
        shiftings = l,
      },
      (r) => {
        shiftings = [],
      },
    );
  }

  Future<void> getPersonals(String userToken, String serviceCode) async {
    final response =
        await _service.getWorkOrderAddedResources(userToken, serviceCode);

    response.fold(
      (l) => {
        addedResources = l,
      },
      (r) => {
        addedResources = [],
      },
    );
  }

  void setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void setUserPeriod(String val) {
    for (var shifting in shiftings) {
      if (shifting.name == val) {
        userPeriodCode = shifting.code.toString();
        return;
      }
    }
  }

  void setUserCode(String val) {
    for (var resource in addedResources) {
      if (resource.fullname == val) {
        userCode = resource.code.toString();
        return;
      }
    }
  }
}
