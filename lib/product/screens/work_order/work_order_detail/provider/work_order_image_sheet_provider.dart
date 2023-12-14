import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import '../../../../../feature/injection.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderImageSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  final ImagePicker picker = ImagePicker();

  File? image;
  String desc = '';
  bool isLoading = false;
  bool isSuccess = false;
  bool errorAccur = false;

  void addImage(String workOrderCode) async {
    if (image != null) {
      isLoading = true;
      notifyListeners();

      Uint8List imagebytes = await image!.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string

      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.addWorkOrderAttachment(userToken, userCode, workOrderCode, base64string, desc);

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
    }
    isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      isSuccess = false;
      errorAccur = false;
    });
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> getImageFromGalery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  void setDesc(String val) {
    desc = val;
  }
}
