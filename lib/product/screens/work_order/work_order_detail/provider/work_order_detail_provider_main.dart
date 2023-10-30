import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_time_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_change_state_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_details_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderDetailMainProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  bool initState = true;
  bool errorActive = false;
  bool isStartEnable = false;
  bool isEndEnable = false;
  bool changedWorkOrderStatus = false;
  
  bool _loading = false;
  bool get loading => _loading;
  bool _isFetchSummary = true;
  bool get isFetchSummary => _isFetchSummary;
  
  IssueSummaryTimeModel _issueSummaryTimeInfo = const IssueSummaryTimeModel();
  IssueSummaryTimeModel get issueSummaryTimeInfo => _issueSummaryTimeInfo;

  WorkOrderDetailsModel workOrderDetailsModel = const WorkOrderDetailsModel();
  WorkOrderChangeStateModel changeStateModel = const WorkOrderChangeStateModel();

  void getWorkOrderDetail(String workOrderCode) async {
    if (initState) {
      initState = false;
      notifyListeners();
      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.getWorkOrderDetails(userCode, workOrderCode);

      response.fold(
        (l) => {
          workOrderDetailsModel = l,
          _setStartEndActivity(),
        },
        (r) => {
          errorActive = true,
        },
      );
      notifyListeners();
    }
  }

  void getWorkOrderWithoutPermission(String workOrderCode) async {
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.getWorkOrderDetails(userCode, workOrderCode);

    response.fold(
      (l) => {
        workOrderDetailsModel = l,
        _setStartEndActivity(),
      },
      (r) => {
        errorActive = true,
      },
    );
    notifyListeners();
  }

  void changeWorkOrderStatus(String workOrderCode, String type) async {
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    final response = await _service.changeWorkOrderStatus(userCode, userCode, workOrderCode, type);

    response.fold(
      (l) => {
        l.result != null && l.result == true
            ? {
                changeStateModel = l,
                changedWorkOrderStatus = true,
              }
            : changedWorkOrderStatus = false,
      },
      (r) => {
        changedWorkOrderStatus = true,
      },
    );
    if (changedWorkOrderStatus) {
      getWorkOrderWithoutPermission(workOrderCode);
    }
  }

  void getIssueTimeInfo(String issuecode) async {
    String userCode = await SharedManager().getString(SharedEnum.userCode);

    _isFetchSummary = false;
    _loading = true;
    notifyListeners();
    final response = await _service.getIssueTimeInfo(issuecode,userCode);
    response.fold(
        (l) => {
              _issueSummaryTimeInfo = l,
              _loading = false,

            },
        (r) => {
            });
    notifyListeners();
  }

  void _setStartEndActivity() {
    switch (workOrderDetailsModel.status) {
      case 'Open':
        isStartEnable = true;
        isEndEnable = false;
        break;
      case 'WIP':
        isStartEnable = false;
        isEndEnable = true;
        break;
      case 'Pending':
        isStartEnable = false;
        isEndEnable = true;
      case 'Closed':
        isStartEnable = false;
        isEndEnable = false;
        break;
    }
  }
}
