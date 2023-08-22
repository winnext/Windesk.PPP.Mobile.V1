import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_store_product_model.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_stores_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderMaterialSheetProvider extends ChangeNotifier {
  final WorkOrderServiceRepository _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool init = true;
  bool isLoading = false;
  bool showProduct = false;

  String userToken = '';
  String userCode = '';

  List<WorkOrderStores> stores = [];
  List<String> storeNames = [];

  List<WorkOrderStoreProductModel> storeProducts = [];
  List<String> storeProductNames = [];

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

  void _filterStoreProductNames() {
    for (var product in storeProducts) {
      if (!storeProductNames.contains(product.name)) storeProductNames.add(product.name ?? '');
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
