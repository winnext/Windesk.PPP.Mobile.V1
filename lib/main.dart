import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/elastic_log/elastic_log.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_filter_bottom_sheet_provider.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

import 'feature/constants/other/app_strings.dart';
import 'feature/global_providers/global_provider.dart';
import 'feature/injection.dart';
import 'feature/route/app_route.dart';
import 'feature/service/firebase/firebase_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Injection().initInstances();
  FirebaseNotification.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
        ChangeNotifierProvider<IssueProvider>(create: (_) => IssueProvider()),
        ChangeNotifierProvider<IssueFilterModalBottomSheetProvider>(
            create: (_) => IssueFilterModalBottomSheetProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return FGBGNotifier(
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
        ),
        onEvent: (event) {
          ElasticLog().sendLog(
              'info', 'UserAppNotifier', event.toString(), 'userAppNotifier');
        });
  }
}
