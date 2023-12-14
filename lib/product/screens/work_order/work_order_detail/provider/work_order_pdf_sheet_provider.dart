import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../feature/database/shared_manager.dart';
import '../../../../../feature/enums/shared_enums.dart';
import '../../../../../feature/injection.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderPdfSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service =
      Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  File? doc;

  bool isLoading = false;
  bool isSuccess = false;
  bool errorAccur = false;
  String desc = '';

  void addPdf(String workOrderCode) async {
    if (doc != null) {
      isLoading = true;
      notifyListeners();

      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userCode = await SharedManager().getString(SharedEnum.userCode);

      Uint8List imagebytes = await doc!.readAsBytes(); //convert to bytes
      String base64string =
          base64.encode(imagebytes); //convert bytes to base64 string

      final response = await _service.addWorkOrderAttachment(
          userToken, userCode, workOrderCode, base64string, desc);

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
      isLoading = false;
      notifyListeners();

      Future.delayed(const Duration(seconds: 2), () {
        isSuccess = false;
        errorAccur = false;
      });
      notifyListeners();
    }
  }

  Future<void> getPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      doc = File(result.paths.first!);
      notifyListeners();
    }
  }

  void setDesc(String val) => desc = val;
}
