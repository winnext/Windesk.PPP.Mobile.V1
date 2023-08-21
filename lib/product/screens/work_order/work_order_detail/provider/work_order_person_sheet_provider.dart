import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_added_resources_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_shiftings_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderPersonSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  List<WorkOrderShiftingsModel> shiftings = [];
  List<WorkOrderAddedResources> addedResources = [];
  bool init = true;
  bool isLoading = false;

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
    final response = await _service.getWorkOrderAddedResources(userToken, serviceCode);

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
}
