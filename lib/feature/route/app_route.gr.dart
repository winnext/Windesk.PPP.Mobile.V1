// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i3;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i4;
import 'package:wm_ppp_4/feature/route/empty_search_router.dart' as _i5;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i15;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i6;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_activities_screen.dart'
    as _i7;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_detail_screen.dart'
    as _i8;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_files_screen.dart'
    as _i9;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_list_screen.dart'
    as _i10;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_notes_screen.dart'
    as _i11;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_summary_screen.dart'
    as _i13;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_tracing_list.dart'
    as _i14;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i16;
import 'package:wm_ppp_4/product/screens/search/screens/asset_search/view/asset_search_page.dart'
    as _i2;
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/view/issue_search_page.dart'
    as _i12;
import 'package:wm_ppp_4/product/screens/search/search_screen.dart' as _i17;
import 'package:wm_ppp_4/product/screens/search_work_order/view/search_work_order_screen.dart'
    as _i18;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i19;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i20;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_list_screen.dart'
    as _i22;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_main_screen.dart'
    as _i23;
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/view/work_order_detail_screen.dart'
    as _i21;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    AssetSearchRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AssetSearchPage(),
      );
    },
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CustomTracingList(
          key: args.key,
          title: args.title,
          count: args.count,
          code: args.code,
          isWorkOrder: args.isWorkOrder,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouter(),
      );
    },
    EmptySearchRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptySearchRouter(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    IssueActivitiesScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.IssueActivitiesScreen(),
      );
    },
    IssueDetailScreen.name: (routeData) {
      final args = routeData.argsAs<IssueDetailScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.IssueDetailScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueFilesScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.IssueFilesScreen(),
      );
    },
    IssueListScreen.name: (routeData) {
      final args = routeData.argsAs<IssueListScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.IssueListScreen(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
        ),
      );
    },
    IssueNotesScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.IssueNotesScreen(),
      );
    },
    IssueSearchRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.IssueSearchPage(),
      );
    },
    IssueSummaryScreen.name: (routeData) {
      final args = routeData.argsAs<IssueSummaryScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.IssueSummaryScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.IssueTracingList(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SearchScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SearchWorkOrderScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.TestScreen(),
      );
    },
    WorkOrderDetailScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderDetailScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WorkOrderDetailScreen(
          key: args.key,
          workorderCode: args.workorderCode,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderListScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.WorkOrderListScreen(
          key: args.key,
          workOrderCode: args.workOrderCode,
          workOrderName: args.workOrderName,
        ),
      );
    },
    WorkOrderMainScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.WorkOrderMainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i24.PageRouteInfo<void> {
  const AppWrapper({List<_i24.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AssetSearchPage]
class AssetSearchRoute extends _i24.PageRouteInfo<void> {
  const AssetSearchRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AssetSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssetSearchRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CustomTracingList]
class CustomTracingList extends _i24.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i25.Key? key,
    required String title,
    required String count,
    required String code,
    required bool isWorkOrder,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CustomTracingList.name,
          args: CustomTracingListArgs(
            key: key,
            title: title,
            count: count,
            code: code,
            isWorkOrder: isWorkOrder,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomTracingList';

  static const _i24.PageInfo<CustomTracingListArgs> page =
      _i24.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
    required this.isWorkOrder,
  });

  final _i25.Key? key;

  final String title;

  final String count;

  final String code;

  final bool isWorkOrder;

  @override
  String toString() {
    return 'CustomTracingListArgs{key: $key, title: $title, count: $count, code: $code, isWorkOrder: $isWorkOrder}';
  }
}

/// generated route for
/// [_i4.EmptyRouter]
class EmptyRouter extends _i24.PageRouteInfo<void> {
  const EmptyRouter({List<_i24.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EmptySearchRouter]
class EmptySearchRouter extends _i24.PageRouteInfo<void> {
  const EmptySearchRouter({List<_i24.PageRouteInfo>? children})
      : super(
          EmptySearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i24.PageRouteInfo<void> {
  const HomeScreen({List<_i24.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.IssueActivitiesScreen]
class IssueActivitiesScreen extends _i24.PageRouteInfo<void> {
  const IssueActivitiesScreen({List<_i24.PageRouteInfo>? children})
      : super(
          IssueActivitiesScreen.name,
          initialChildren: children,
        );

  static const String name = 'IssueActivitiesScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IssueDetailScreen]
class IssueDetailScreen extends _i24.PageRouteInfo<IssueDetailScreenArgs> {
  IssueDetailScreen({
    _i25.Key? key,
    required String issueCode,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          IssueDetailScreen.name,
          args: IssueDetailScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueDetailScreen';

  static const _i24.PageInfo<IssueDetailScreenArgs> page =
      _i24.PageInfo<IssueDetailScreenArgs>(name);
}

class IssueDetailScreenArgs {
  const IssueDetailScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i25.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueDetailScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i9.IssueFilesScreen]
class IssueFilesScreen extends _i24.PageRouteInfo<void> {
  const IssueFilesScreen({List<_i24.PageRouteInfo>? children})
      : super(
          IssueFilesScreen.name,
          initialChildren: children,
        );

  static const String name = 'IssueFilesScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IssueListScreen]
class IssueListScreen extends _i24.PageRouteInfo<IssueListScreenArgs> {
  IssueListScreen({
    _i25.Key? key,
    required String issueModuleCode,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          IssueListScreen.name,
          args: IssueListScreenArgs(
            key: key,
            issueModuleCode: issueModuleCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueListScreen';

  static const _i24.PageInfo<IssueListScreenArgs> page =
      _i24.PageInfo<IssueListScreenArgs>(name);
}

class IssueListScreenArgs {
  const IssueListScreenArgs({
    this.key,
    required this.issueModuleCode,
  });

  final _i25.Key? key;

  final String issueModuleCode;

  @override
  String toString() {
    return 'IssueListScreenArgs{key: $key, issueModuleCode: $issueModuleCode}';
  }
}

/// generated route for
/// [_i11.IssueNotesScreen]
class IssueNotesScreen extends _i24.PageRouteInfo<void> {
  const IssueNotesScreen({List<_i24.PageRouteInfo>? children})
      : super(
          IssueNotesScreen.name,
          initialChildren: children,
        );

  static const String name = 'IssueNotesScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.IssueSearchPage]
class IssueSearchRoute extends _i24.PageRouteInfo<void> {
  const IssueSearchRoute({List<_i24.PageRouteInfo>? children})
      : super(
          IssueSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueSearchRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.IssueSummaryScreen]
class IssueSummaryScreen extends _i24.PageRouteInfo<IssueSummaryScreenArgs> {
  IssueSummaryScreen({
    _i25.Key? key,
    required String issueCode,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          IssueSummaryScreen.name,
          args: IssueSummaryScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueSummaryScreen';

  static const _i24.PageInfo<IssueSummaryScreenArgs> page =
      _i24.PageInfo<IssueSummaryScreenArgs>(name);
}

class IssueSummaryScreenArgs {
  const IssueSummaryScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i25.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueSummaryScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i14.IssueTracingList]
class IssueTracingList extends _i24.PageRouteInfo<void> {
  const IssueTracingList({List<_i24.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LoginScreen]
class LoginScreen extends _i24.PageRouteInfo<void> {
  const LoginScreen({List<_i24.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NewOrderScreen]
class NewOrderScreen extends _i24.PageRouteInfo<void> {
  const NewOrderScreen({List<_i24.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SearchScreen]
class SearchScreen extends _i24.PageRouteInfo<void> {
  const SearchScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i24.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SplashScreen]
class SplashScreen extends _i24.PageRouteInfo<void> {
  const SplashScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.TestScreen]
class TestScreen extends _i24.PageRouteInfo<void> {
  const TestScreen({List<_i24.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.WorkOrderDetailScreen]
class WorkOrderDetailScreen
    extends _i24.PageRouteInfo<WorkOrderDetailScreenArgs> {
  WorkOrderDetailScreen({
    _i25.Key? key,
    required String workorderCode,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          WorkOrderDetailScreen.name,
          args: WorkOrderDetailScreenArgs(
            key: key,
            workorderCode: workorderCode,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkOrderDetailScreen';

  static const _i24.PageInfo<WorkOrderDetailScreenArgs> page =
      _i24.PageInfo<WorkOrderDetailScreenArgs>(name);
}

class WorkOrderDetailScreenArgs {
  const WorkOrderDetailScreenArgs({
    this.key,
    required this.workorderCode,
  });

  final _i25.Key? key;

  final String workorderCode;

  @override
  String toString() {
    return 'WorkOrderDetailScreenArgs{key: $key, workorderCode: $workorderCode}';
  }
}

/// generated route for
/// [_i22.WorkOrderListScreen]
class WorkOrderListScreen extends _i24.PageRouteInfo<WorkOrderListScreenArgs> {
  WorkOrderListScreen({
    _i25.Key? key,
    required String workOrderCode,
    required String workOrderName,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          WorkOrderListScreen.name,
          args: WorkOrderListScreenArgs(
            key: key,
            workOrderCode: workOrderCode,
            workOrderName: workOrderName,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i24.PageInfo<WorkOrderListScreenArgs> page =
      _i24.PageInfo<WorkOrderListScreenArgs>(name);
}

class WorkOrderListScreenArgs {
  const WorkOrderListScreenArgs({
    this.key,
    required this.workOrderCode,
    required this.workOrderName,
  });

  final _i25.Key? key;

  final String workOrderCode;

  final String workOrderName;

  @override
  String toString() {
    return 'WorkOrderListScreenArgs{key: $key, workOrderCode: $workOrderCode, workOrderName: $workOrderName}';
  }
}

/// generated route for
/// [_i23.WorkOrderMainScreen]
class WorkOrderMainScreen extends _i24.PageRouteInfo<void> {
  const WorkOrderMainScreen({List<_i24.PageRouteInfo>? children})
      : super(
          WorkOrderMainScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderMainScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
