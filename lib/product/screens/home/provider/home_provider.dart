// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/auth_service/auth_service_repository.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';
import 'package:wm_ppp_4/product/screens/home/service/home_service_repo_impl.dart';

import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/models/home_page_models/announcement_model.dart';

class HomeProvider extends ChangeNotifier {
  final AuthServiceRepository _authServiceRepository =
      AuthServiceRepositoryImpl();
  bool _isUserLogout = false;
  bool get isUserLogout => _isUserLogout;
  set setIsUserLogout(bool isUserLogout) {
    _isUserLogout = isUserLogout;
    notifyListeners();
  }

  bool _logoutError = false;
  bool get logoutError => _logoutError;

  List<AnnouncementModel> _announcementList = [];
  List<AnnouncementModel> get announcementList => _announcementList;
  set setiannouncementList(List<AnnouncementModel> announcementList) {
    _announcementList = announcementList;
    notifyListeners();
  }

  int _totalAnnoucementCount = 0;
  int get totalAnnoucementCount => _totalAnnoucementCount;
  set settotalAnnoucementCount(int totalAnnoucementCount) {
    _totalAnnoucementCount = totalAnnoucementCount;
    notifyListeners();
  }

  void getAnnouncement() {
    final result = HomeServiceRepositoryImpl().getAnnouncements();
    if (result is CustomServiceException) {
    } else {
      announcementList.addAll(result as Iterable<AnnouncementModel>);
    }
    settotalAnnoucementCount = announcementList.length;
    notifyListeners();
  }

  void logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String userCode =
        await SharedManager().getString(SharedEnum.userCode);
    if (userCode.isNotEmpty) {
      final response = await _authServiceRepository.logout(userCode);
      response.fold(
        (l) => {
          ElasticLog().sendLog('info', 'LogoutSuccess',
              'Kullanıcı başarı bir şekilde çıkış yaptı.', 'logoutSuccess'),
          prefs.remove('userCode'),
          SharedManager().clearAll(),
          setIsUserLogout = true,
          notifyListeners(),
          // Future.delayed(const Duration(seconds: 1), () {
          //   _isUserLogout = false;
          // }),
          // notifyListeners(),
        },
        (r) => {
          ElasticLog().sendLog(
              'error',
              'LogoutError',
              'Bağlantı zaman aşımına uğradı. Kullanıcı çıkış yapamadı.',
              'logoutError'),
          _isUserLogout = false,
          _logoutError = true,
          notifyListeners(),
          Future.delayed(const Duration(seconds: 1), () {
            _logoutError = false;
          })
        },
      );
    }
  }

  void _clearShared() async {
    await SharedManager().clearAll();
  }
}
