// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i3;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i4;
import 'package:wm_ppp_4/feature/route/empty_search_router.dart' as _i5;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i11;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i6;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_detail_screen.dart'
    as _i7;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_list_screen.dart'
    as _i8;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_tracing_list.dart'
    as _i10;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i12;
import 'package:wm_ppp_4/product/screens/search/screens/asset_search/view/asset_search_page.dart'
    as _i2;
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/view/issue_search_page.dart'
    as _i9;
import 'package:wm_ppp_4/product/screens/search/view/search_screen.dart'
    as _i13;
import 'package:wm_ppp_4/product/screens/search_work_order/view/search_work_order_screen.dart'
    as _i14;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i15;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i16;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_list_screen.dart'
    as _i18;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_main_screen.dart'
    as _i19;
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/view/work_order_detail_screen.dart'
    as _i17;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    AssetSearchRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AssetSearchPage(),
      );
    },
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i20.AutoRoutePage<dynamic>(
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
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouter(),
      );
    },
    EmptySearchRouter.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptySearchRouter(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    IssueDetailScreen.name: (routeData) {
      final args = routeData.argsAs<IssueDetailScreenArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.IssueDetailScreen(
          key: args.key,
          workOrderCode: args.workOrderCode,
        ),
      );
    },
    IssueListScreen.name: (routeData) {
      final args = routeData.argsAs<IssueListScreenArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.IssueListScreen(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
        ),
      );
    },
    IssueSearchRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.IssueSearchPage(),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.IssueTracingList(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LoginScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SearchScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SearchWorkOrderScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.TestScreen(),
      );
    },
    WorkOrderDetailScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderDetailScreenArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WorkOrderDetailScreen(
          key: args.key,
          workorderCode: args.workorderCode,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderListScreenArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WorkOrderListScreen(
          key: args.key,
          workOrderCode: args.workOrderCode,
          workOrderName: args.workOrderName,
        ),
      );
    },
    WorkOrderMainScreen.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.WorkOrderMainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i20.PageRouteInfo<void> {
  const AppWrapper({List<_i20.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AssetSearchPage]
class AssetSearchRoute extends _i20.PageRouteInfo<void> {
  const AssetSearchRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AssetSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssetSearchRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CustomTracingList]
class CustomTracingList extends _i20.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i21.Key? key,
    required String title,
    required String count,
    required String code,
    required bool isWorkOrder,
    List<_i20.PageRouteInfo>? children,
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

  static const _i20.PageInfo<CustomTracingListArgs> page =
      _i20.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
    required this.isWorkOrder,
  });

  final _i21.Key? key;

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
class EmptyRouter extends _i20.PageRouteInfo<void> {
  const EmptyRouter({List<_i20.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EmptySearchRouter]
class EmptySearchRouter extends _i20.PageRouteInfo<void> {
  const EmptySearchRouter({List<_i20.PageRouteInfo>? children})
      : super(
          EmptySearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRouter';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i20.PageRouteInfo<void> {
  const HomeScreen({List<_i20.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i7.IssueDetailScreen]
class IssueDetailScreen extends _i20.PageRouteInfo<IssueDetailScreenArgs> {
  IssueDetailScreen({
    _i21.Key? key,
    required String workOrderCode,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          IssueDetailScreen.name,
          args: IssueDetailScreenArgs(
            key: key,
            workOrderCode: workOrderCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueDetailScreen';

  static const _i20.PageInfo<IssueDetailScreenArgs> page =
      _i20.PageInfo<IssueDetailScreenArgs>(name);
}

class IssueDetailScreenArgs {
  const IssueDetailScreenArgs({
    this.key,
    required this.workOrderCode,
  });

  final _i21.Key? key;

  final String workOrderCode;

  @override
  String toString() {
    return 'IssueDetailScreenArgs{key: $key, workOrderCode: $workOrderCode}';
  }
}

/// generated route for
/// [_i8.IssueListScreen]
class IssueListScreen extends _i20.PageRouteInfo<IssueListScreenArgs> {
  IssueListScreen({
    _i21.Key? key,
    required String issueModuleCode,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          IssueListScreen.name,
          args: IssueListScreenArgs(
            key: key,
            issueModuleCode: issueModuleCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueListScreen';

  static const _i20.PageInfo<IssueListScreenArgs> page =
      _i20.PageInfo<IssueListScreenArgs>(name);
}

class IssueListScreenArgs {
  const IssueListScreenArgs({
    this.key,
    required this.issueModuleCode,
  });

  final _i21.Key? key;

  final String issueModuleCode;

  @override
  String toString() {
    return 'IssueListScreenArgs{key: $key, issueModuleCode: $issueModuleCode}';
  }
}

/// generated route for
/// [_i9.IssueSearchPage]
class IssueSearchRoute extends _i20.PageRouteInfo<void> {
  const IssueSearchRoute({List<_i20.PageRouteInfo>? children})
      : super(
          IssueSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueSearchRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IssueTracingList]
class IssueTracingList extends _i20.PageRouteInfo<void> {
  const IssueTracingList({List<_i20.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoginScreen]
class LoginScreen extends _i20.PageRouteInfo<void> {
  const LoginScreen({List<_i20.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewOrderScreen]
class NewOrderScreen extends _i20.PageRouteInfo<void> {
  const NewOrderScreen({List<_i20.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SearchScreen]
class SearchScreen extends _i20.PageRouteInfo<void> {
  const SearchScreen({List<_i20.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i20.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i20.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashScreen]
class SplashScreen extends _i20.PageRouteInfo<void> {
  const SplashScreen({List<_i20.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.TestScreen]
class TestScreen extends _i20.PageRouteInfo<void> {
  const TestScreen({List<_i20.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i17.WorkOrderDetailScreen]
class WorkOrderDetailScreen
    extends _i20.PageRouteInfo<WorkOrderDetailScreenArgs> {
  WorkOrderDetailScreen({
    _i21.Key? key,
    required String workorderCode,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          WorkOrderDetailScreen.name,
          args: WorkOrderDetailScreenArgs(
            key: key,
            workorderCode: workorderCode,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkOrderDetailScreen';

  static const _i20.PageInfo<WorkOrderDetailScreenArgs> page =
      _i20.PageInfo<WorkOrderDetailScreenArgs>(name);
}

class WorkOrderDetailScreenArgs {
  const WorkOrderDetailScreenArgs({
    this.key,
    required this.workorderCode,
  });

  final _i21.Key? key;

  final String workorderCode;

  @override
  String toString() {
    return 'WorkOrderDetailScreenArgs{key: $key, workorderCode: $workorderCode}';
  }
}

/// generated route for
/// [_i18.WorkOrderListScreen]
class WorkOrderListScreen extends _i20.PageRouteInfo<WorkOrderListScreenArgs> {
  WorkOrderListScreen({
    _i21.Key? key,
    required String workOrderCode,
    required String workOrderName,
    List<_i20.PageRouteInfo>? children,
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

  static const _i20.PageInfo<WorkOrderListScreenArgs> page =
      _i20.PageInfo<WorkOrderListScreenArgs>(name);
}

class WorkOrderListScreenArgs {
  const WorkOrderListScreenArgs({
    this.key,
    required this.workOrderCode,
    required this.workOrderName,
  });

  final _i21.Key? key;

  final String workOrderCode;

  final String workOrderName;

  @override
  String toString() {
    return 'WorkOrderListScreenArgs{key: $key, workOrderCode: $workOrderCode, workOrderName: $workOrderName}';
  }
}

/// generated route for
/// [_i19.WorkOrderMainScreen]
class WorkOrderMainScreen extends _i20.PageRouteInfo<void> {
  const WorkOrderMainScreen({List<_i20.PageRouteInfo>? children})
      : super(
          WorkOrderMainScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderMainScreen';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
