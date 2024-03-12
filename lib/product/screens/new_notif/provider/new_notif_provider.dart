import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/service_response_status_enums.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';
import 'package:wm_ppp_4/feature/service/service_manager.dart';

class NewNotifProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service =
      Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  final ImagePicker picker = ImagePicker();
  File? image;
  bool isLoading = false;
  bool isSuccess = false;
  bool errorAccur = false;

  final _mahal = TextEditingController();
  TextEditingController get mahal => _mahal;
  set setMahal(String mahal) {
    _mahal.text = mahal;
    notifyListeners();
  }

  String _selectedCallType = 'case';
  String get selectedCallType => _selectedCallType;
  set setSelectedCallType(String selectedCallType) {
    _selectedCallType = selectedCallType;
    notifyListeners();
  }

  final _desc = TextEditingController();
  TextEditingController get desc => _desc;
  set setDesc(String desc) {
    _desc.text = desc;
    notifyListeners();
  }

  String _photoDesc = '';
  String get photoDesc => _photoDesc;
  setPhotoDesc(photoDesc) {
    _photoDesc = photoDesc;
    notifyListeners();
  }

  String _date = '';
  String get date => _date;
  void setDate(String newValue) {
    _date = newValue;
    notifyListeners();
  }

  cleanAll() {
    setDate('');
    setDesc = '';
    setMahal = '';
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (barcodeScanRes != '-1') {
      setMahal = barcodeScanRes;
    }
  }

  void addIdariCallInfo2(context, issueCode) async {
    String photo = '';
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    bool result = await sendIssue(
        'addIdariCallInfo',
        userToken,
        userCode,
        _desc.text,
        _mahal.text,
        '',
        date,
        photo,
        '',
        'complaint',
        selectedCallType,
        issueCode);
    if (mahal.text != '') {
      if (result) {
        snackBar(context, 'Bildirim Başarıyla Oluşturuldu', 'success');
        cleanAll();
      } else {
        snackBar(context, 'Bildirim Oluşturulamadı', 'error');
      }
    } else {
      snackBar(context, 'Lütfen mahal giriniz', 'info');
    }
  }

  void addIdariCallInfo(context, issueCode) async {
    String photo = '';
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    bool result = await sendIssue(
        'addIdariCallInfo',
        userToken,
        userCode,
        _desc.text,
        _mahal.text,
        '',
        date,
        photo,
        '',
        selectedCallType,
        '',
        issueCode);
    if (mahal.text != '') {
      if (result) {
        snackBar(context, 'Bildirim Başarıyla Oluşturuldu', 'success');
        cleanAll();
      } else {
        snackBar(context, 'Bildirim Oluşturulamadı', 'error');
      }
    } else {
      snackBar(context, 'Lütfen mahal giriniz', 'info');
    }
  }

  sendIssue(
      String action,
      String userToken,
      String xusercode,
      String desc,
      String fromeLoc,
      String toLoc,
      String date,
      String photo,
      String dateTimeInfo,
      String webCallType,
      String complaintReason,
      String relIssueCode) async {
    final Dio dio = Injection.getIt.get<ServiceManager>().dio;

    String url =
        '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$userToken&action=$action&username=$xusercode&desc=$desc&locName=$toLoc&locCode=$fromeLoc&cmp=DIA&webCallType=$webCallType&complaintReason=$complaintReason&relIssueCode=$relIssueCode&date=$date';
    try {
      print(url);
      final response = await dio.get(url);
      print(response.data);
      if (response.data[ServiceResponseStatusEnums.success.rawText]) {
        //final data = response.data[ServiceResponseStatusEnums.records.rawText];
        isSuccess = true;
        notifyListeners();
        print('ok');
        return true;
      } else {
        isSuccess = false;
        notifyListeners();

        print('yok');
        return false;
      }
    } catch (error) {
      print('catch');
    }
  }

  void addImage(String workOrderCode) async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    if (image != null) {
      isLoading = true;
      notifyListeners();

      Uint8List imagebytes = await image!.readAsBytes(); //convert to bytes
      String base64string =
          base64.encode(imagebytes); //convert bytes to base64 string
      print(base64string);
      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.addWorkOrderAttachment(
          userToken, userCode, workOrderCode, base64string, photoDesc);

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
}
