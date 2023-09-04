import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../feature/constants/other/snackbar_strings.dart';
import '../../../../feature/route/app_route.gr.dart';

import '../../../../feature/components/buttons/custom_login_button.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/components/loading/custom_main_loading.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/constants/style/custom_paddings.dart';
import '../../../../feature/constants/style/font_sizes.dart';
import '../provider/login_provider.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/input_fields/text_fields_password_input_underline.dart';
import '../../../../feature/constants/paths/asset_paths.dart';
import '../../../../feature/extensions/context_extension.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginPassword()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: Consumer<LoginProvider>(
        builder: (context, LoginProvider loginProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (loginProvider.isErrorActive) {
              snackBar(context, SnackbarStrings.loginError, 'error');
            }
            if (loginProvider.textFieldEmptyError) {
              snackBar(context, SnackbarStrings.loginEmptyError, 'error');
            }
            if (loginProvider.isLoginSuccess) {
              snackBar(context, SnackbarStrings.loginSuccess, 'success');
            }
          });

          return _LoginScreenBody(provider: loginProvider);
        },
      ),
    );
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody({required this.provider});
  final LoginProvider provider;

  @override
  State<_LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey<ScaffoldMessengerState>();

  final String _userNameHint = 'Kullanıcı Adı';

  final String _passwordHint = 'Şifre';

  final String _login = 'Giriş Yap';

  late bool _isChecked = false;

  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.provider.setPasswordAndUserName();

    Future.delayed(const Duration(milliseconds: 1000), () {
      _isChecked = widget.provider.isLoginInfoSave;
      _isChecked == true ? {controllerUserName.text = widget.provider.userCode, controllerPassword.text = widget.provider.password} : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.provider.isLoginSuccess ? context.router.push(const HomeScreen()) : null;
    return Scaffold(
      key: _globalKey,
      appBar: CustomMainAppbar(title: _loginAppbarTitle(context), returnBack: false),
      body: widget.provider.loading
          ? const CustomMainLoading()
          : Column(
              children: <Widget>[
                _loginImage(context),
                _loginTitleWidget(),
                _textFields(context, widget.provider),
                _loginButton(),
              ],
            ),
    );
  }

  Expanded _loginButton() {
    return Expanded(
      flex: 2,
      child: CustomLoginButton(title: _login, onPressed: widget.provider.logIn),
    );
  }

  Widget _textFields(BuildContext context, LoginProvider loginProvider) {
    return Consumer(
      builder: (context, LoginPassword provider, child) {
        return Expanded(
          flex: 3,
          child: Padding(
            padding: CustomPaddings.onlyHorizontalHigh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFieldsInputUnderline(controller: controllerUserName, hintText: _userNameHint, onChanged: loginProvider.setUserCode),
                TextInputFieldsPasswordInputUnderline(
                  controller: controllerPassword,
                  hintText: _passwordHint,
                  onChanged: loginProvider.setPassword,
                  changeVisibility: provider.setShowPassword,
                  showPassword: provider.showPassword,
                ),
                // Checkbox(
                //   checkColor: Colors.white,
                //   value: _isChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _isChecked = value ?? false;
                //       loginProvider.setIsLoginSaveInfo(_isChecked);
                //     });
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _loginTitleWidget() {
    return Expanded(
      flex: 1,
      child: Text(
        _login,
        style: const TextStyle(fontSize: FontSizes.titleLarge, fontFamily: 'Roboto'),
      ),
    );
  }

  Expanded _loginImage(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Image.asset(
        AssetPaths.loginPic,
        height: MediaQuery.of(context).size.width / 1,
        width: MediaQuery.of(context).size.width / 1,
        fit: BoxFit.cover,
      ),
    );
  }

  Image _loginAppbarTitle(BuildContext context) {
    return Image.asset(
      AssetPaths.windesk,
      width: context.width / 1.5,
      height: context.width / 1.5,
      fit: BoxFit.cover,
    );
  }
}
