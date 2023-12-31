import 'package:get_it/get_it.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

import 'global_providers/global_provider.dart';
import 'log/log_manager.dart';
import 'service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';
import 'service/service_manager.dart';

class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerSingleton<LogManager>(LogManager())
      ..registerSingleton<GlobalProvider>(GlobalProvider())
      ..registerSingleton<IssueProvider>(IssueProvider())

      // services
      ..registerLazySingleton<WorkOrderServiceRepositoryImpl>(() => WorkOrderServiceRepositoryImpl());
  }
}
