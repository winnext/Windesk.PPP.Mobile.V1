import 'package:flutter/material.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/database/shared_manager.dart';
import '../../../../feature/enums/shared_enums.dart';
import '../../../../feature/service/global_services.dart/auth_service/auth_service_repository.dart';
import '../../../../feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';

class LoginProvider extends ChangeNotifier {
  AuthServiceRepository authService = AuthServiceRepositoryImpl();

  bool _loading = false;
  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  String _userCode = '';
  String get userCode => _userName;

  String _password = '';
  String get password => _password;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isLoginInfoSave = false;
  bool get isLoginInfoSave => _isLoginInfoSave;

  bool _isErrorActive = false;
  bool get isErrorActive => _isErrorActive;

  bool _textFieldEmptyError = false;
  bool get textFieldEmptyError => _textFieldEmptyError;

  void logIn(BuildContext context) async {
    if (_userCode.isNotEmpty && _password.isNotEmpty) {
      _loading = true;
      notifyListeners();
      final response = await authService.login(_userCode, password);

      response.fold((login) {
        _loading = false;
        notifyListeners();
        if (login.result == 'success') {
          _isLoginSuccess = true;
          _userName = login.record![0]['FULLNAME'];
          _userCode = login.record![0]['CODE'];
          _password = password;
          _setTokenToPreferences();
          notifyListeners();

          Future.delayed(const Duration(milliseconds: 1000), () {
            _isLoginSuccess = false;
            notifyListeners();
          });
        } else {
          _loading = false;
          _isLoginSuccess = false;
          _isErrorActive = true;
          notifyListeners();
          Future.delayed(const Duration(milliseconds: 1000), () {
            _isErrorActive = false;
            notifyListeners();
          });
        }
      }, (error) {
        _isLoginSuccess = false;
        _isErrorActive = true;
        _loading = false;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _isErrorActive = false;
        });
      });
    } else {
      _textFieldEmptyError = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 1000), () {
        _textFieldEmptyError = false;
      });
    }
  }

  void _setTokenToPreferences() async {
    await SharedManager().setString(SharedEnum.userCode, _userCode);
    await SharedManager().setString(SharedEnum.userName, _userName);
    await SharedManager().setString(SharedEnum.userPassword, _password);
  }

  // set functions
  void setUserName(String value) {
    _userName = value;
  }

  void setUserCode(String value) {
    _userCode = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setPasswordAndUserName() async {
    String userCode = await SharedManager().getString(SharedEnum.userCode);
    String userPassword = await SharedManager().getString(SharedEnum.userPassword);
    setPassword(userPassword);
    setUserCode(userCode);
  }

  void showSnckbar(BuildContext context, String message, String type) {
    snackBar(context, message, type);
  }

  void setIsLoginSaveInfo(bool value) async {
    _isLoginInfoSave = value;
    await SharedManager().setBool(SharedEnum.isLoginInfoSave, _isLoginInfoSave);
  }

  void setStart() {
    _userCode = '';
    _isLoginSuccess = false;
    _textFieldEmptyError = false;
    _isErrorActive = false;
    notifyListeners();
  }
}

class LoginPassword extends ChangeNotifier {
  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void setShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }
}
