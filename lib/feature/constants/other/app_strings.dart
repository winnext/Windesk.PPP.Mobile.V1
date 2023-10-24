import 'package:flutter/material.dart';

@immutable
class AppStrings {
  const AppStrings._();

  // app name
  static const String appName = 'Windesk FM Mobile V1';

  // app navigation tabs
  static const String homeTab = 'Ana Sayfa';
  static const String newOrderTab = 'Yeni İş Emri';
  static const String searchTab = 'Arama';
  static const String testTab = 'Test';

  // app circular home button strings
  static const String caseSlaList = 'Talep Listesi';
  static const String caseSlaSearch = 'Talep Arama';
  static const String workOrderList = 'İş Emri Listesi';
  static const String workOrderSearch = 'İş Emri Arama';
  static const String newWorkOrder = 'Yeni İş Emri';

  //caseSlaSearch
  static const String entitiySearch = 'Envanter Arama';
  static const String spaceSearch = 'Mahal Arama';

  static const String entitiyCode = 'Envanter Kodu';
  static const String serialNumber = 'Seri No';
  static const String rfid = 'RFID';
  static const String space = 'Mahal';

  // date strings
  static const day = 'gün';
  static const hour = 'saat';
  static const minute = 'dk.';
  static const second = 'sn.';

  // workorder tabs
  static const myOrders = 'Üzerimdekiler';
  static const myGroups = 'Grubumdakiler';
  static const myPendiks = 'Bekleyenler';

  //button
  static const start = 'Başlat';
  static const end = 'Bitir';
  static const cancel = 'Vazgeç';
  static const reject = 'Reddet';
  static const save = 'Kaydet';
  static const approve = 'Onayla';
  static const String clean = 'Temizle';
  static const String search = 'Ara';

  //Add efforts labels
  static const addEffort = 'Efor Ekle';
  static const date = 'Süre Seçiniz';

  // add material strings
  static const addMaterial = 'Malzeme Ekle';
  static const chooseWareHouse = 'Depo Seçiniz';
  static const chooseProduct = 'Ürün Seçiniz';

  static const chooseUnit = 'Birim Seçiniz';
  static const enterAmount = 'Miktar Giriniz';

  // add personal strings
  static const addPersonal = 'Personel Ekle';

  // accordion titles
  static const materials = 'Malzemeler';
  static const workers = 'Personeller';
  static const efforts = 'Eforlar';
  static const documants = 'Dökümanlar';
  static const order = 'Talimat';

  // sub accordion titles
  static const addedMaterials = 'Eklenmiş Malzemeler';
  static const addedPersonals = 'Eklenmiş Personaller';
  static const addedEfforts = 'Eklenmiş Eforlar';
  static const requstedMaterials = 'Talep Edilen Malzemeler';
  static const addPdf = 'Pdf Ekle';
  static const addImage = 'Fotoğraf Ekle';
  static const addedDocumants = 'Eklenmiş Dökümanlar';

  //test page strings
  static const accessTest = 'Erişim Testi';
  static const issueNotify = 'Hata Bildir';
  static const windeskHelp = 'Windesk Destek';
  static const device = 'Cihaz : ';
  static const os = 'OS : ';
  static const appVersion = 'Uygulama Versiyonu : ';
  static const connectionTime = 'Bağlantı Zamanı';
  static const serverTime = 'Sunucu Saati : ';
  static const phoneTime = 'Telefon Saati : ';
  static const windeskSuccess = 'Windesk : Erişim Başarılı';
  static const windeskConnFail = 'Windesk : Erişim Başarısız';
  static const windeskConnWait = 'Windesk : Erişim Bekleniyor...';
  static const mobilServerSuccess = 'Mobil Servis : Erişim Başarılı';
  static const mobilServerConnFail = 'Mobil Servis : Erişim Başarısız';
  static const mobilServerConnWait = 'Mobil Servis : Erişim Bekleniyor...';

  //issue filter strings
  static const state = 'Durum';
  static const build = 'Bina';
  static const floor = 'Kat';
  static const wing = 'Kanat';
  static const taskForMe = 'Üzerime Atanan Talepler';

  static const logout = 'Çıkış Yap';
  static const title = 'Yardım Masası Uygulaması';

  // work order sheets
  static const String choosenEffortDuration = 'Efor Süresi Seçiniz';
  static const choosePersonal = 'Personel Seçiniz';
  static const chooseShift = 'Vardiya Seçiniz';
  static const pickStore = 'Depo Seçiniz';
  static const pickProduct = 'Malzeme Seçiniz';
  static const pickProductAmount = 'Ürün Miktarı Seçiniz';
  static const enterProductAmount = 'Miktar Giriniz';
  static const enterDescription = 'Açıklama Giriniz';
  static const addDocumant = 'Döküman Ekle';
  static const chooseFromGalery = 'Galeriden Seç';
  static const chooseFromCamera = 'Kameradan Seç';

  // snackbar messages
  static const String effortAdded = 'Effor başarıyla eklenmiştir';
  static const String materialAdded = 'Malzeme eklenmiştir';
  static const String effortAddedError =
      'Effor eklenirken bir sorunla karşıaşıldı, lütfen birazdan tekrar deneyininiz';
  static const String materialAddedError =
      'Malzeme eklenirken bir sorunla karşıaşıldı, lütfen birazdan tekrar deneyininiz';
  static const String personalAdded = 'Personal başarıyla eklenmiştir';
  static const String personalAddedError =
      'Personal eklenirken bir hatayla karşılaşıldı, lütfen birazdan tekrar deneyininiz';
  static const String imageAdded = 'Fotoğraf başarıyla eklendi';
  static const String imageAddedError =
      'Fotoğraf eklenirken bir hatayla karşılaşıldı, lütfen birazdan tekrar deneyininiz';
  static const String docAdded = 'Belge başarıyla eklenmiştir';
  static const String docAddedError =
      'Belge eklenirken bir hatayla karşılaşıldı, lütfen birazdan tekrar deneyininiz';
  static const String effortDeleted = 'Effor başarıyla silinmiştir';
  static const String sparepartsDeleted = 'Malzeme başarıyla silinmiştir';
  static const String personalDeleted = 'Personel başarıyla silinmiştir';
  static const String deleteError = 'Silme işlemi gerçekleştirilemedi.';
  static const String docDeleted = 'Belge başarıyla silinmiştir';
  static const String stateChanged = 'İş Emri durumu değiştirilmiştir';

  // alert dialog
  static const String deleteTitle = 'Silme İşlemi';
  static const String deleteEffort =
      ' kodlu eforu silmek istediğinize emin misiniz?';
  static const String deleteResources =
      ' kodlu personeli silmek istediğinize emin misiniz?';
  static const String deleteSparepart =
      ' kodlu materyali silmek istediğinize emin misiniz?';
  static const String deleteDocumant =
      ' kodlu dökümanı silmek istediğinize emin misiniz?';
  static const String myResponsibles = 'Sorumlu Olduklarım';
  static const String filter = 'Filtrele';
  static const String cantFound = 'Kayıt bulunamadı';
}
