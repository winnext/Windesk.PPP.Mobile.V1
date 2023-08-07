import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreen.page, path: '/splashScreen', initial: true),
        AutoRoute(path: '/loginScreen', page: LoginScreen.page),
        AutoRoute(
          path: '/appWrapper',
          page: AppWrapper.page,
          children: [
            AutoRoute(
              path: 'emptyHomeScreen',
              page: EmptyRouter.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'homeScreen'),
                AutoRoute(path: 'homeScreen', page: HomeScreen.page, initial: true),
                AutoRoute(path: 'workOrderScreen', page: WorkOrderScreen.page),
                AutoRoute(path: 'searchWorkOrderScreen', page: SearchWorkOrderScreen.page),
                AutoRoute(path: 'issueTracingList', page: IssueTracingList.page),
                AutoRoute(path: 'issueList', page: IssueList.page),
              ],
            ),
            AutoRoute(path: 'newOrderScreen', page: NewOrderScreen.page),
            AutoRoute(path: 'searchScreen', page: SearchScreen.page),
            AutoRoute(path: 'testScreen', page: TestScreen.page),
          ],
        ),
        // AutoRoute(page: DummyScreenThreeChild.page, path: '/dummy3Child')
      ];
}
