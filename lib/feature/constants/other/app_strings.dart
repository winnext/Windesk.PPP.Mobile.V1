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
  static const String caseSlaList = 'Vaka-(SLA) Listesi';
  static const String caseSlaSearch = 'Vaka-(SLA) Arama';
  static const String workOrderList = 'İş Emri Listesi';
  static const String workOrderSearch = 'İş Emri Arama';
  static const String newWorkOrder = 'Yeni İş Emri';

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
  static const taskForMe = 'Üzerime Atanan Vakalar';

  static const logout = 'Çıkış Yap';
  static const title = 'Yardım Masası Uygulaması';

  // work order sheets
  static const String choosenEffortDuration = 'Efor Süresi Seçiniz';
  static const choosePersonal = 'Personel Seçiniz';
  static const chooseShift = 'Vardiya Seçiniz';
  static const pickStore = 'Depo Seçiniz';
  static const pickProduct = 'Malzeme Seçiniz';
  static const pickProductAmount = 'Ürün Miktarı Seçiniz';
  static const enterProductAmount = 'Miktar Gİriniz';
}
