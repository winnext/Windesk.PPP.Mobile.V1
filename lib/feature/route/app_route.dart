import 'package:auto_route/auto_route.dart';
import 'package:wm_ppp_4/product/screens/new_notif/new_notif_page.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: SplashScreen.page, path: '/splashScreen', initial: true),
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
                AutoRoute(
                    path: 'homeScreen', page: HomeScreen.page, initial: true),
                // work order

                AutoRoute(
                    path: 'workOrderListScreen',
                    page: WorkOrderListScreen.page),
                CustomRoute(
                  path: 'workOrderScreen',
                  page: WorkOrderMainScreen.page,
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),
                CustomRoute(
                  path: 'workOrderDetailScreen',
                  page: WorkOrderDetailScreen.page,
                  transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                ),

                AutoRoute(path: 'issueSearchPage', page: IssueSearchRoute.page),
                AutoRoute(path: 'assetSearchPage', page: AssetSearchRoute.page),
                AutoRoute(path: 'woSearchPage', page: WoSearchRoute.page),
                AutoRoute(
                    path: 'assetSearchListPage',
                    page: AssetSearchListRoute.page),
                AutoRoute(path: 'spaceSearchPage', page: SpaceSearchRoute.page),

                // issue
                AutoRoute(
                    path: 'issueTracingList', page: IssueTracingList.page),
                AutoRoute(path: 'issueListScreen', page: IssueListScreen.page),
                AutoRoute(
                    path: 'issueDetailScreen', page: IssueDetailScreen.page),
                AutoRoute(
                    path: 'issueActivitiesScreen',
                    page: IssueActivitiesScreen.page),
                AutoRoute(
                    path: 'issueFilesScreen', page: IssueFilesScreen.page),
                AutoRoute(
                    path: 'issueNotesScreen', page: IssueNotesScreen.page),
                AutoRoute(
                    path: 'issueSummaryScreen', page: IssueSummaryScreen.page),
                AutoRoute(path: 'newNotifPage', page: NewNotifRoute.page),
                AutoRoute(path: 'newNotifScreen', page: NewNotifScreen.page),
                AutoRoute(path: 'suggestion', page: Suggestion.page),

                AutoRoute(path: 'caseSearch', page: CaseSearch.page),
                AutoRoute(path: 'caseDetail', page: CaseCompDetail.page),
                AutoRoute(
                    path: 'caseComplaintPage', page: CaseComplaintRoute.page)
              ],
            ),
            AutoRoute(
                path: 'newOrderScreen',
                page: NewOrderScreen.page,
                children: [
                  CustomRoute(
                    path: 'workOrderDetailScreen',
                    page: WorkOrderDetailScreen.page,
                    transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                  ),
                ]),

            // AutoRoute(
            //   path: 'searchScreen',
            //   page: SearchScreen.page,
            // ),
            AutoRoute(
              path: 'emptyHomeScreen',
              page: EmptySearchRouter.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'searchScreen'),
                AutoRoute(
                    path: 'searchScreen',
                    page: SearchScreen.page,
                    initial: true),
                AutoRoute(path: 'issueSearchPage', page: IssueSearchRoute.page),
                AutoRoute(
                    path: 'issueDetailScreen', page: IssueDetailScreen.page),
                AutoRoute(path: 'assetSearchPage', page: AssetSearchRoute.page),
                AutoRoute(path: 'woSearchPage', page: WoSearchRoute.page),
                AutoRoute(
                    path: 'assetSearchListPage',
                    page: AssetSearchListRoute.page),
                AutoRoute(path: 'spaceSearchPage', page: SpaceSearchRoute.page),
              ],
            ),
            AutoRoute(path: 'testScreen', page: TestScreen.page),
          ],
        ),
        // AutoRoute(page: DummyScreenThreeChild.page, path: '/dummy3Child')
      ];
}
