import 'package:flutter/material.dart';
import '../../../../../feature/database/shared_manager.dart';
import '../../../../../feature/enums/shared_enums.dart';
import '../../../../../feature/injection.dart';
import '../../../../../feature/models/work_order_models/work_order_store_product_model.dart';
import '../../../../../feature/models/work_order_models/work_order_store_product_package_info_model.dart';
import '../../../../../feature/models/work_order_models/work_order_stores_model.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import '../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderMaterialSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool init = true;
  bool isLoading = false;
  bool showProduct = false;
  bool showPackageInfo = false;
  bool materialSuccessfullyAdded = false;
  bool errorAccur = false;

  String userToken = '';
  String userCode = '';

  String choosenProductCode = '';
  String choosenProductPackageInfoName = '';
  String choosenProductPackageInfoCode = '';
  String choosenAmount = '';

  List<WorkOrderStores> stores = [];
  List<String> storeNames = [];

  List<WorkOrderStoreProductModel> storeProducts = [];
  List<String> storeProductNames = [];

  List<WorkOrderStoreProductPackageInfoModel> productPackageInfo = [];
  List<String> productPackageNames = [];

  void setChoosenAmount(String val) => choosenAmount = val;

  void setChoosenPackageInfo(String val) => choosenProductPackageInfoName = val;

  void addMaterial(String workOrderCode) async {
    for (var product in productPackageInfo) {
      if (choosenProductPackageInfoName.compareTo(product.amount ?? '') == 0) {
        choosenProductPackageInfoCode = product.code.toString();
      }
    }

    final response = await _service.addWorkOrderSpareparts(
      userToken,
      workOrderCode,
      choosenProductCode,
      choosenAmount,
      choosenProductPackageInfoCode,
    );

    response.fold(
      (l) => {
        if (l == true)
          {
            materialSuccessfullyAdded = true,
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

    notifyListeners();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        errorAccur = false;
        materialSuccessfullyAdded = false;
      },
    );
    notifyListeners();
  }

  void initState() async {
    if (init) {
      _changeLoading();
      userToken = await SharedManager().getString(SharedEnum.deviceId);
      userCode = await SharedManager().getString(SharedEnum.userCode);
      await getStores();
      init = false;
      _changeLoading();
      notifyListeners();
    }
  }

  Future<void> getStores() async {
    final response = await _service.getWorkOrderStores(userToken, userCode);

    response.fold(
      (l) => {
        stores = l,
        _filterStoreNames(),
      },
      (r) => {
        stores = [],
      },
    );
  }

  Future<void> getStoreProducts(String storeName) async {
    String storeCode = '';
    storeProducts = [];
    storeProductNames = [];

    // get store code
    for (var store in stores) {
      if (store.name?.compareTo(storeName) == 0) {
        storeCode = store.code ?? '';
      }
    }
    if (storeCode.isNotEmpty) {
      final response = await _service.getWorkOrderStoreProducts(userToken, storeCode);

      response.fold(
        (l) => {
          storeProducts = l,
          _filterStoreProductNames(),
        },
        (r) => {
          storeProducts = [],
        },
      );
    }
    showProduct = true;
    notifyListeners();
  }

  Future<void> getStoreProductPackageInfos(String productName) async {
    String productCode = '';
    productPackageInfo = [];
    productPackageNames = [];

    // get product def code
    for (var product in storeProducts) {
      if (product.name?.compareTo(productName) == 0) {
        productCode = product.productdefcode ?? '';
        choosenProductCode = product.productdefcode ?? '';
      }
    }

    if (productCode.isNotEmpty) {
      final response = await _service.getWorkOrderStoreProductPackageInfo(userToken, productCode);

      response.fold(
        (l) => {
          productPackageInfo = l,
          _filterProductPackageInfos(),
        },
        (r) => {
          productPackageInfo = [],
        },
      );
    }
    showPackageInfo = true;
    notifyListeners();
  }

  void _filterProductPackageInfos() {
    for (var packageInfo in productPackageInfo) {
      if (!productPackageNames.contains(packageInfo.amount) || packageInfo.amount != null) productPackageNames.add(packageInfo.amount ?? '');
    }
    notifyListeners();
  }

  void _filterStoreProductNames() {
    for (var product in storeProducts) {
      if (!storeProductNames.contains(product.name) || product.name != null || product.name != '') storeProductNames.add(product.name ?? '');
    }
    notifyListeners();
  }

  void _filterStoreNames() {
    for (var store in stores) {
      if (!storeNames.contains(store.name)) storeNames.add(store.name ?? '');
    }
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
