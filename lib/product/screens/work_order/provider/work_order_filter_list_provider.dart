import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/building_type_enums.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_filter_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/work_order_models/work_order_buildings_and_floors_model.dart';
import '../../../../feature/models/work_order_models/work_order_status_model.dart';
import '../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';

class WorkOrderFilterListProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool error = false;
  bool isLoading = false;
  bool _initState = true;
  List<WorkOrderStatusModel> status = [];
  List<WorkOrderBuildingsAndFloorsModel> buildings = [];
  List<WorkOrderBuildingsAndFloorsModel> floors = [];

  bool foundWorkOrder = false;
  bool errorAccurWhileSearching = false;

  int check = 0;

  String choosenStatus = '';
  String choosenBuilding = '';
  String choosenFloor = '';
  String filterTextField = '';

  String choosenStatusCode = '';
  String choosenBuildingCode = '';
  String choosenFloorCode = '';

  void fetchInitValues() async {
    if (_initState) {
      // open loading
      isLoading = true;
      notifyListeners();

      await _getStatus();
      await _getBuildings();
      await _getFloors();

      // close loading
      _initState = false;
      isLoading = false;
      notifyListeners();
    }
  }

  void setStatus(String value) {
    choosenStatus = value;
    notifyListeners();
  }

  void setBuilding(String value) {
    choosenBuilding = value;
    notifyListeners();
  }

  void setFloor(String value) {
    choosenFloor = value;
    notifyListeners();
  }

  void clearStatus() {
    choosenStatus = '';
    notifyListeners();
  }

  void clearBuilding() {
    choosenBuilding = '';
    notifyListeners();
  }

  void clearFloor() {
    choosenFloor = '';
    notifyListeners();
  }

  void clearAll() {
    choosenStatus = '';
    choosenBuilding = '';
    choosenFloor = '';
    notifyListeners();
  }

  void searchWorkOrder(BuildContext context) async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final String userName = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.getWorkOrderDetailsByCode(userToken, filterTextField, userName);

    response.fold(
      (l) => {
        foundWorkOrder = true,
        context.router.pop<WorkOrderFilterModel>(
          WorkOrderFilterModel(searchNeed: true, workOrderCode: filterTextField),
        ),
      },
      (r) => {
        errorAccurWhileSearching = true,
      },
    );

    notifyListeners();
    check++;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        foundWorkOrder = false;
        errorAccurWhileSearching = false;
        notifyListeners();
      },
    );
  }

  String getChoosenStatusCode() {
    for (var element in status) {
      if (element.dispvalue == choosenStatus) {
        choosenStatusCode = element.realvalue ?? '';
      }
    }
    return choosenStatusCode;
  }

  String getChoosenBuildingCode() {
    for (var element in buildings) {
      if (element.name == choosenBuilding) {
        choosenBuildingCode = element.code ?? '';
      }
    }
    return choosenBuildingCode;
  }

  String getChoosenFloorCode() {
    for (var element in floors) {
      if (element.name == choosenFloor) {
        choosenFloorCode = element.code ?? '';
      }
    }
    return choosenFloorCode;
  }

  void setFilterTextField(String value) {
    filterTextField = value;
  }

  Future<void> _getStatus() async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final response = await _service.getWorkOrderStatus(userToken);

    response.fold(
      (value) {
        status = value;
      },
      (error) {
        this.error = true;
      },
    );
  }

  Future<void> _getBuildings() async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final response = await _service.getWorkOrderBuildingsAndFloors(userToken, BuildingTypeEnums.building);

    response.fold(
      (value) {
        buildings = value;
      },
      (error) {
        this.error = true;
      },
    );
  }

  Future<void> _getFloors() async {
    final String userToken = await SharedManager().getString(SharedEnum.deviceId);
    final response = await _service.getWorkOrderBuildingsAndFloors(userToken, BuildingTypeEnums.floor);

    response.fold(
      (value) {
        floors = value;
      },
      (error) {
        this.error = true;
      },
    );
  }
}
