import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_asset_search_list_model.dart';

import '../../../service/search_service_repo_impl.dart';

class AssetSearchProvider extends ChangeNotifier {
  // ignore: unused_field
  final SearchServiceRepoImpml _searchServiceRepository =
      SearchServiceRepoImpml();
  List<WorkOrderAssetSearchList> _assetSearchListPageModel = [];
  List<WorkOrderAssetSearchList> get assetSearchListPageModel =>
      _assetSearchListPageModel;
  set setAssetSearchListPageModel(
      List<WorkOrderAssetSearchList> assetSearchListPageModel) {
    _assetSearchListPageModel = assetSearchListPageModel;
    notifyListeners();
  }

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

  getAssetSearchList(entityCode, seriNo, rfid, typeCode, brandCode, modelCode,
      locCode, currentPage) async {
    num limitStart = 20 * (currentPage - 1);
    num limitEnd = 20 * currentPage;
    final response = await _searchServiceRepository.assetSearchList(
        entityCode,
        seriNo,
        rfid,
        typeCode,
        brandCode,
        modelCode,
        locCode,
        limitStart.toString(),
        limitEnd.toString());
    response.fold((l) => {setAssetSearchListPageModel = l, notifyListeners()},
        (r) => null);
  }
}
