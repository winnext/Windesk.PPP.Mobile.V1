import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';
import '../../../../feature/models/work_order_models/work_order_list_model.dart';
import '../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

import '../../../../feature/injection.dart';

class WorkOrderListProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl workOrderService = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  late final Timer timer;

  WorkOrderListProvider() {
    _getUsercode();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => getCurrentTime());
  }

  bool _initialState = true;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _fetchWorkOrderListError = false;
  bool get fetchWorkOrderListError => _fetchWorkOrderListError;

  List<WorkOrderListModel> workOrderListModel = [];

  String currentTimeText = '';
  String title = '';

  // pagination values
  int _startLimit = 0;
  int _endLimit = 10;
  bool isLastPage = false;
  final int _dataPerPage = 10;

  // String filter values
  String build = '';
  String floor = '';
  String responsible = '';
  String status = '';
  String buildingName = '';
  String floorName = '';
  String statusName = '';

  void setBuildingName(String val) {
    buildingName = val;
    notifyListeners();
  }

  void setFloorName(String val) {
    floorName = val;
    notifyListeners();
  }

  void setStatusName(String val) {
    statusName = val;
    notifyListeners();
  }

  void setBuild(String val) => build = val;

  void setFloor(String val) => floor = val;

  void setStatus(String val) => status = val;

  void setLoading() => _isLoading = !_isLoading;

  void clearBuild(String workOrderCode) {
    build = '';
    buildingName = '';
    notifyListeners();
    getWorkOrderListWithoutPermission(workOrderCode);
  }

  void clearFloor(String workOrderCode) {
    floor = '';
    floorName = '';
    notifyListeners();
    getWorkOrderListWithoutPermission(workOrderCode);
  }

  void clearStatus(String workOrderCode) {
    status = '';
    statusName = '';
    notifyListeners();
    getWorkOrderListWithoutPermission(workOrderCode);
  }

  void searchWorkOrder(String workOrderCode) {}

  void getWorkOrderList(String workOrderCode) async {
    if (_initialState) {
      _initialState = false;
      setLoading();
      notifyListeners();

      String userCode = await SharedManager().getString(SharedEnum.userCode);

      final response = await workOrderService.getWorkOrderList(
        userCode,
        workOrderCode,
        _startLimit.toString(),
        _endLimit.toString(),
        build,
        floor,
        responsible,
        status,
      );

      response.fold(
        (l) => {
          _startLimit = _endLimit + 1,
          _endLimit = _endLimit + _dataPerPage + 1,
          workOrderListModel = l,
        },
        (r) => {
          _fetchWorkOrderListError = true,
        },
      );
      setLoading();
      notifyListeners();
      _fetchWorkOrderListError = false;
    }
  }

  void getWorkOrderListWithoutPermission(String workOrderCode) async {
    _startLimit = 0;
    _endLimit = 10;
    setLoading();
    notifyListeners();

    // ignore: avoid_print
    print('build: $build');
    // ignore: avoid_print
    print('floor: $floor');
    // ignore: avoid_print
    print('status: $status');

    String userCode = await SharedManager().getString(SharedEnum.userCode);

    final response = await workOrderService.getWorkOrderList(
      userCode,
      workOrderCode,
      _startLimit.toString(),
      _endLimit.toString(),
      build,
      floor,
      responsible,
      status,
    );

    response.fold(
      (l) => {
        _startLimit = _endLimit + 1,
        _endLimit = _endLimit + _dataPerPage + 1,
        workOrderListModel = l,
      },
      (r) => {
        _fetchWorkOrderListError = true,
      },
    );
    setLoading();
    notifyListeners();
  }

  void getMoreOrderList(String workOrderCode) async {
    String userCode = await SharedManager().getString(SharedEnum.userCode);

    final response = await workOrderService.getWorkOrderList(
      userCode,
      workOrderCode,
      _startLimit.toString(),
      _endLimit.toString(),
      build,
      floor,
      responsible,
      status,
    );

    response.fold(
      (l) => {
        if (l.length != 10)
          {
            isLastPage = true,
          },
        _startLimit = _endLimit + 1,
        _endLimit = _endLimit + _dataPerPage + 1,
        workOrderListModel.addAll(l),
      },
      (r) => {
        _fetchWorkOrderListError = true,
      },
    );
    notifyListeners();
  }

  void getCurrentTime() {
    currentTimeText = DateTime.now().toString().substring(0, 19);
    notifyListeners();
  }

  void closeTimer() {
    timer.cancel();
  }

  void _getUsercode() async {
    await SharedManager().getString(SharedEnum.userCode).then((value) => title = value);
    notifyListeners();
  }
}
