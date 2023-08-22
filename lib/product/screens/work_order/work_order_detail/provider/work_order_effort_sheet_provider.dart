import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import '../../../../../feature/injection.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderEffortSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool succesfullyEffortAdded = false;
  bool errorAccur = false;
  bool isUserClickedDropdown = false;
  String choosenEffortType = '15 dk';
  int choosenEffortDay = 0;
  int choosenEffortHour = 0;
  int choosenEffortMinute = 0;

  void onChangedChoosenEffortDuration(String val) {
    choosenEffortType = val;
  }

  void onChangedChoosenEffortDay(int val) {
    choosenEffortDay = val;
  }

  void onChangedChoosenEffortHour(int val) {
    choosenEffortHour = val;
  }

  void onChangedChoosenEffortMinute(int val) {
    choosenEffortMinute = val;
  }

  void addEffort(String workOrderCode) async {
    if (isUserClickedDropdown) {
      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userName = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.addWorkOrderEffort(userToken, workOrderCode, userName, setEffortDuration());

      response.fold(
        (l) => {
          if (l == true)
            {
              succesfullyEffortAdded = true,
            }
          else
            {
              errorAccur = false,
            }
        },
        (r) => {
          errorAccur = false,
        },
      );
    } else {
      errorAccur = false;
    }

    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      succesfullyEffortAdded = false;
      errorAccur = false;
    });
  }

  String setEffortDuration() {
    String duration = '';
    if (choosenEffortType == 'Serbest Seçim') {
      // day
      duration += setTime(choosenEffortDay);
      // hour
      duration += setTime(choosenEffortHour);
      // minute
      duration += setTime(choosenEffortMinute);
      // last two num
      duration += '00';
    } else {
      List<String> time = choosenEffortType.split(' ');
      if (time.last == 'dk') {
        duration = '000000${setTime(int.tryParse(time.first) ?? 0)}00';
      } else if (time.last == 'sa') {
        duration = '0000${setTime(int.tryParse(time.first) ?? 0)}0000';
      }
    }
    return duration;
  }

  String setTime(int time) {
    String duration = '';
    if (time == 0) {
      duration += '00';
    } else if (time < 10) {
      duration += '0$time';
    } else {
      duration += '$time';
    }
    return duration;
  }
}
