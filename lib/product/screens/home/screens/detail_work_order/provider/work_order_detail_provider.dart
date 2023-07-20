import 'package:flutter/material.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';

class WorkOrderDetailProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService =
      WorkSpaceServiceRepositoryImpl();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  WorkSpaceDetail? _woDetailList;
  WorkSpaceDetail? get woDetailList => _woDetailList;

  void getWorkOrderWithSearch(String workOrderCode) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result =
        await workSpaceService.getWorkOrderWithSearch(workOrderCode, userToken);

    result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {});
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }
}
