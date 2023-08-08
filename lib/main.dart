import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/constants/other/app_strings.dart';
import 'feature/global_providers/global_provider.dart';
import 'feature/injection.dart';
import 'feature/route/app_route.dart';
import 'feature/service/firebase/firebase_notification.dart';

// empty commit
// empty commit

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Injection().initInstances();
  FirebaseNotification.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
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
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: AppStrings.appName,
    );
  }
}
