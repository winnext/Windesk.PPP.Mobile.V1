import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../service/search_service_repo_impl.dart';

class AssetSearchProvider extends ChangeNotifier {
  final SearchServiceRepoImpml _searchServiceRepository =
      SearchServiceRepoImpml();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  String _searchIssueCode = '';
  String get searchIssueCode => _searchIssueCode;
  set setSearchIssueCode(String searchIssueCode) {
    _searchIssueCode = searchIssueCode;
    notifyListeners();
  }

  final _entityCode = TextEditingController();

  TextEditingController get entityCode => _entityCode;

  set setEntityCode(String entityCode) {
    _entityCode.text = entityCode;
    notifyListeners();
  }

  final _serialNumber = TextEditingController();

  TextEditingController get serialNumber => _serialNumber;

  set setSerialNumber(String serialNumber) {
    _serialNumber.text = serialNumber;
    notifyListeners();
  }

  final _rfidCode = TextEditingController();

  TextEditingController get rfidCode => _rfidCode;

  set setRfidCode(String rfidCode) {
    _rfidCode.text = rfidCode;
    notifyListeners();
  }

  final _spaceCode = TextEditingController();

  TextEditingController get spaceCode => _spaceCode;

  set setSpaceCode(String spaceCode) {
    _spaceCode.text = spaceCode;
    notifyListeners();
  }

  getWorkOrderWithSearch() async {
    if (entityCode.text != '') {
      // String userToken = await SharedManager().getString(SharedEnum.userToken);

      // _isLoading = true;
      // notifyListeners();
      // final result = await workSpaceService
      //     .getWorkSpaceWithSearchFromGroupWorks(woNumber.text, userToken);

      // result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {
      //   _isSuccess = true;
      //   _woDetailList = null;
      // });

      // isSuccess
      //     ? woDetailList != null
      //         ? context.router.push(DetailWorkOrderScreen(
      //             workSpaceDetail: woDetailList!))
      //         : null
      //     : null;
      notifyListeners();

      _isLoading = false;
      notifyListeners();
    }
  }

  void scanBarcodeAndQr(state) async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      if (state == 'entitiy') {
        setEntityCode = barcodeScanRes;
      } else if (state == 'serialNumber') {
        setSerialNumber = barcodeScanRes;
      } else if (state == 'rfid') {
        setRfidCode = barcodeScanRes;
      } else if (state == 'space') {
        setSpaceCode = barcodeScanRes;
      }
    }
    notifyListeners();
  }

  void scanEntityCode() async {
    scanBarcodeAndQr('entitiy');
  }

  void scanSerialNumber() async {
    scanBarcodeAndQr('serialNumber');
  }

  void scanRfid() async {
    scanBarcodeAndQr('rfid');
  }

  void scanSpace() async {
    scanBarcodeAndQr('space');
  }

  void onChangedFunction(String workOrderNumber) {
    setEntityCode = workOrderNumber;
  }

  void clearInput() {
    _isSuccess = false;
    setEntityCode = '';
    setSerialNumber = '';
    setRfidCode = '';
    setSpaceCode = '';
    notifyListeners();
  }

  void assetSearch() {
    print('assetSearch');
  }
}
