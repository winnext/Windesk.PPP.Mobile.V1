// ignore_for_file: non_constant_identifier_names, prefer_is_empty, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';
import 'package:wm_ppp_4/product/screens/new_order/new_order_repo.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/view/work_order_detail_screen.dart';

class NewOrderProvider extends ChangeNotifier {
  final apirepository = NewOrderRepo();

  final _mahal = TextEditingController();
  TextEditingController get mahal => _mahal;
  set setMahal(String mahal) {
    _mahal.text = mahal;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  final _aciklama = TextEditingController();
  TextEditingController get aciklama => _aciklama;
  set setAciklama(String aciklama) {
    _aciklama.text = aciklama;
    notifyListeners();
  }

  final _varlik = TextEditingController();
  TextEditingController get varlik => _varlik;
  set setVarlik(String varlik) {
    _varlik.text = varlik;
    notifyListeners();
  }

  final _arayan_num = TextEditingController();
  TextEditingController get arayan_num => _arayan_num;
  set setArayanNum(String arayan_num) {
    _arayan_num.text = arayan_num;
    notifyListeners();
  }
//File? _image;
  //File? get image => _image;

  // void setFile(File file) {
  //   _image = file;
  //   notifyListeners();
  // }
  final List _photos = [];
  List get photos => _photos;

  set setPhotos(String photosx) {
    _photos.add(photosx);
    notifyListeners();
  }

  set deletePhotos(index) {
    _photos.removeAt(index);
    notifyListeners();
  }

  final _b64s = [];
  get b64s => _b64s;

  set setB64(b64x) {
    _b64s.add(b64x);
    notifyListeners();
  }

  set deleteB64(index) {
    _b64s.removeAt(index);
    notifyListeners();
  }

  set clear(index) {
    if (_mahal.text != '') {
      _mahal.text = '';
    }
    if (_aciklama.text != '') {
      _aciklama.text = '';
    }
    if (_arayan_num.text != '') {
      _arayan_num.text = '';
    }
    if (_photos.length != 0) {
      _photos.clear();
    }
    if (_b64s.length != 0) {
      _b64s.clear();
    }
    notifyListeners();
  }

//////////////////////////////////////////////
///////////// Hizmet ////////////////////////
////////////////////////////////////////////
  List<List<String>> _woCreateHizmetListeArray = [];

  List<List<String>> get woCreateHizmetListeArray => _woCreateHizmetListeArray;
  set setCreateWoHizmetListeArray(List<List<String>> woCreateHizmetListeArray) {
    _woCreateHizmetListeArray = woCreateHizmetListeArray;
    notifyListeners();
  }

  String _woCreateHizmetValue = '';

  String get woCreateHizmetValue => _woCreateHizmetValue;
  set setWoCreateHizmetValue(String woCreateHizmetValue) {
    _woCreateHizmetValue = woCreateHizmetValue;
    notifyListeners();
  }

  woCreateHizmetListesi() async {
    setLoading = true;

    List<String> name = ['Hizmet'];
    List<String> code = ['Hizmet'];

    final woCreateHizmetListesiSonuc =
        await apirepository.woCreateHizmetListesiApi();
    print('sonuc : ');
    print(woCreateHizmetListesiSonuc);
    for (var element in woCreateHizmetListesiSonuc) {
      name.add(element['NAME'].toString());
    }
    for (var element in woCreateHizmetListesiSonuc) {
      code.add(element['CODE'].toString());
    }

    setCreateWoHizmetListeArray = [name] + [code];
    setWoCreateHizmetValue =
        woCreateHizmetValue != '' ? woCreateHizmetValue : name[0];
    setLoading = false;
    notifyListeners();
  }

//////////////////////////////////////////////
///////////// İş Emri Adı ////////////////////////
////////////////////////////////////////////

  List<List<String>> _woCreateIsEmriAdiListeArray = [
    [
      'Seçiniz',
      'Teknik Onarım',
      'Teknik Periyodik Bakım',
      'Tıbbi Cihaz Kalibrasyonu',
      'Teknik Periyodik Kontrol',
      'Tıbbi Cihaz Periyodik Kontrol',
      'Tıbbi Cihaz Onarım',
      'Periyodik Bakım',
      'Önleyici Bakım',
      'Görev İş Emri',
      'İç Denetim',
      'İzleme İş Emirleri',
      'Anlık Görev',
      'Arıza İş Emri'
    ],
    [
      'Seçiniz',
      'accidental',
      'planned',
      'calibration',
      'periodiccontrol',
      'medicalperiodiccontrol',
      'medicalaccidental'
          'periodic_maintenance',
      'preventive_maintenance',
      'task_workorder',
      'internal_audit',
      'watchingWorkorder'
          'reactive',
      'arizi_workorder'
    ]
  ];

  List<List<String>> get woCreateIsEmriAdiListeArray =>
      _woCreateIsEmriAdiListeArray;
  set setWoCreateIsEmriAdiListeArray(
      List<List<String>> woCreateIsEmriAdiListeArray) {
    _woCreateIsEmriAdiListeArray = woCreateIsEmriAdiListeArray;
    notifyListeners();
  }

  String _woCreateIsEmriAdiListeValue = '';

  String get woCreateIsEmriAdiListeValue => _woCreateIsEmriAdiListeValue;
  set setWoCreateIsEmriAdiListeValue(String woCreateIsEmriAdiListeValue) {
    _woCreateIsEmriAdiListeValue = woCreateIsEmriAdiListeValue;
    notifyListeners();
  }

//////////////////////////////////////////////
///////////// Öncelik ////////////////////////
////////////////////////////////////////////

  List<List<String>> _woCreateOncelikListeArray = [
    ['Normal', 'Öncelikli', 'Acil'],
    ['0', '1', '2']
  ];

  List<List<String>> get woCreateOncelikListeArray =>
      _woCreateOncelikListeArray;
  set setwoCreateOncelikListeArray(
      List<List<String>> woCreateOncelikListeArray) {
    _woCreateOncelikListeArray = woCreateOncelikListeArray;
    notifyListeners();
  }

  String _woCreateOncelikListeValue = '';

  String get woCreateOncelikListeValue => _woCreateOncelikListeValue;
  set setwoCreateOncelikListeValue(String woCreateOncelikListeValue) {
    _woCreateOncelikListeValue = woCreateOncelikListeValue;
    notifyListeners();
  }

//////////////////////////////////////////////
///////////// WO Create /////////////////////
////////////////////////////////////////////
  ///
  ///

  showAlertDialog(BuildContext context, title, metin, woCode) {
    // set up the buttons
    showDialog(
      context: context,
      builder: (alertContext) => AlertDialog(
        title: Text(title.toString()),
        content: Text(metin),
        actions: [
          ElevatedButton(
            child: const Text("Tamam"),
            onPressed: () => Navigator.pop(alertContext),
          ),
          ElevatedButton(
              child: const Text("Detayı Gör"),
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WorkOrderDetailScreen(workorderCode: woCode)),
                    )

                    // context.router
                    //     .push(WorkOrderDetailScreen(workorderCode: woCode))
                  }),
        ],
      ),
    );
  }

  woCreate(context) async {
    String woSpace = mahal.text;
    print('WoSpace Mahal : $woSpace');

    String woService = woCreateHizmetValue;
    print('Wo Service Hizmet Value : $woService');

    String woName = woCreateIsEmriAdiListeValue;
    print('Wo Name İşEmriAdi Value : $woName');

    String woNameLabel = woCreateIsEmriAdiListeValue;
    print('Wo Name Label İşEmriAdi : $woNameLabel');

    String priority_type = woCreateOncelikListeValue;
    print('Oncelik Value: $priority_type');

    String workorder_cfg = varlik.text;
    print('Varlik : $workorder_cfg');

    String woDesc = aciklama.text;
    print('WoDesc : ${aciklama.text}');

    var image = b64s;
    if (b64s.length > 0) {
      image = b64s[0];
    }
    print('b64s length : ${b64s.length}');
    print('image  : ');
    print(image);

    if (woSpace != '' &&
        woService != '' &&
        woService != 'Hizmet' &&
        woName != 'Seçiniz' &&
        woName != '') {
      woService = woCreateHizmetListeArray[1]
          [woCreateHizmetListeArray[0].indexOf(woService)];
      woName = woCreateIsEmriAdiListeArray[1]
          [woCreateIsEmriAdiListeArray[0].indexOf(woName)];
      if (woCreateOncelikListeArray[0].indexOf(priority_type) != -1) {
        priority_type = woCreateOncelikListeArray[1]
            [woCreateOncelikListeArray[0].indexOf(priority_type)];
      } else {
        priority_type = woCreateOncelikListeArray[1][0];
      }

      print('woservice val  : ');
      print(woService);

      print('woName val : ');
      print(woName);

      print('oncelik val  : ');
      print(priority_type);

      final woCreateSonuc = await apirepository.woCreate(woSpace, woService,
          woName, woNameLabel, priority_type, workorder_cfg, woDesc, image);
      print('sonucxx : ');
      print(woCreateSonuc);
      if (woCreateSonuc[0][0] == 0) {
        snackBar(context, woCreateSonuc[1], 'hata');
      } else {
        snackBar(context, woCreateSonuc[1]['uyari'], 'success');

        setWoCreateHizmetValue = woCreateHizmetListeArray[0][0];
        setWoCreateIsEmriAdiListeValue = woCreateIsEmriAdiListeArray[0][0];
        setwoCreateOncelikListeValue = woCreateOncelikListeArray[0][0];

        clear = 1;
        setVarlik = '';

        if (image.length != 0) {
          isLoading = true;
          notifyListeners();

          Uint8List imagebytes = await image!.readAsBytes(); //convert to bytes
          String base64string =
              base64.encode(imagebytes); //convert bytes to base64 string

          String userToken =
              await SharedManager().getString(SharedEnum.deviceId);
          String userCode =
              await SharedManager().getString(SharedEnum.userCode);
          final response = await _service.addWorkOrderAttachment(userToken,
              userCode, woCreateSonuc[1]['code'], base64string, desc);

          response.fold(
            (l) => {
              if (l)
                {
                  isSuccess = true,
                  showAlertDialog(context, 'İş Emri Başarıyla Oluşturuldu',
                      woCreateSonuc[1]['uyari'], woCreateSonuc[1]['code'])
                }
              else
                {errorAccur = true, snackBar(context, woCreateSonuc[1], 'hata')}
            },
            (r) => {
              errorAccur = true,
              snackBar(context, woCreateSonuc[1], 'hata')
            },
          );
        } else {
          showAlertDialog(context, 'İş Emri Başarıyla Oluşturuldu',
              woCreateSonuc[1]['uyari'], woCreateSonuc[1]['code']);
        }
      }
    } else {
      snackBar(context, 'İş Emri tipi, tanımı ve mahali zorunludur', 'hata');
    }
  }

//////////////////////////////////////////////
////// WO Search Görebilme Yetkisi //////////
////////////////////////////////////////////

  checkWorkorderByAuthorizedServices(username, woCode) async {
    print('WoCode : $woCode');
    final checkSonuc = await apirepository
        .checkWorkorderByAuthorizedServicesApi('kullanıcı_Adi', woCode);
    print('Check Sonuc : ');
    print(checkSonuc);

    return checkSonuc;
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.QR);
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

  // Platform messages are asynchronous, so we initialize in an async method.
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

  final WorkOrderServiceRepository _service =
      Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
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
      String base64string =
          base64.encode(imagebytes); //convert bytes to base64 string

      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userCode = await SharedManager().getString(SharedEnum.userCode);
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
    }
    isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      isSuccess = false;
      errorAccur = false;
    });
  }

  void setDesc(String val) {
    desc = val;
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  initFunc() async {
    print('giriyor');
    List<String> hizmet = woCreateHizmetListeArray.isNotEmpty
        ? woCreateHizmetListeArray[0]
        : ['Hizmet'];
    List hizmetDatasi = woCreateHizmetListeArray;

    String dropdownvalueHizmet = !loading
        ? hizmetDatasi[0].indexOf(woCreateHizmetValue) != -1
            ? woCreateHizmetValue
            : hizmet[0]
        : 'Hizmet';
    setWoCreateHizmetValue = dropdownvalueHizmet;

//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//////////////////////  İş Emri Adı     /////////////////////////
/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

    List<String> isEmriAdi = woCreateIsEmriAdiListeArray[0];
    List<List<String>> isEmriAdiDatasi = woCreateIsEmriAdiListeArray;

    String dropdownvalueIsEmriAdi =
        isEmriAdiDatasi[0].contains(woCreateIsEmriAdiListeValue)
            ? woCreateIsEmriAdiListeValue
            : isEmriAdi[0];
    setWoCreateIsEmriAdiListeValue = dropdownvalueIsEmriAdi;

//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//////////////////////  Öncelik     /////////////////////////
/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

    List<String> oncelik = woCreateOncelikListeArray[0];
    List oncelikDatasi = woCreateOncelikListeArray;

    String dropdownvalueOncelik =
        oncelikDatasi[0].indexOf(woCreateOncelikListeValue) != -1
            ? woCreateOncelikListeValue
            : oncelik[0];
    setwoCreateOncelikListeValue = dropdownvalueOncelik;
    notifyListeners();
  }
}
