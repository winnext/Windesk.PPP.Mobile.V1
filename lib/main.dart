import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
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

  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'cache.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE cache(id INTEGER PRIMARY KEY, logLevel TEXT,title TEXT,message TEXT,activity TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

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
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
