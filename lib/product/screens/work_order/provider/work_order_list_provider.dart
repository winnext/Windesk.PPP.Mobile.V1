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
  final int _dataPerPage = 10;

  // String filter values
  String build = '';
  String floor = '';
  String responsible = '';
  String status = '';

  void setLoading() {
    _isLoading = !_isLoading;
  }

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
        _startLimit.toString(),
        build,
        floor,
        responsible,
        status,
      );

      response.fold(
        (l) => {
          _startLimit = _endLimit + 1,
          _endLimit = _endLimit + _dataPerPage,
          workOrderListModel.addAll(l),
        },
        (r) => {
          _fetchWorkOrderListError = true,
        },
      );
      setLoading();
    }
    notifyListeners();
    _fetchWorkOrderListError = false;
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
