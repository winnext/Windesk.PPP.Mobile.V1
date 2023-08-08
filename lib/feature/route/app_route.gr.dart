// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i2;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i3;
import 'package:wm_ppp_4/feature/route/empty_search_router.dart' as _i4;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i9;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i5;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_list_screen.dart'
    as _i6;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_tracing_list.dart'
    as _i8;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i10;
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/view/issue_search_page.dart'
    as _i7;
import 'package:wm_ppp_4/product/screens/search/view/search_screen.dart'
    as _i11;
import 'package:wm_ppp_4/product/screens/search_work_order/view/search_work_order_screen.dart'
    as _i12;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i13;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i14;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_list_screen.dart'
    as _i15;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_screen.dart'
    as _i16;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CustomTracingList(
          key: args.key,
          title: args.title,
          count: args.count,
          code: args.code,
          isWorkOrder: args.isWorkOrder,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouter(),
      );
    },
    EmptySearchRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptySearchRouter(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    IssueListScreen.name: (routeData) {
      final args = routeData.argsAs<IssueListScreenArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.IssueListScreen(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
        ),
      );
    },
    IssueSearchRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.IssueSearchPage(),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.IssueTracingList(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SearchWorkOrderScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.TestScreen(),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WorkOrderListScreen(),
      );
    },
    WorkOrderScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.WorkOrderScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i17.PageRouteInfo<void> {
  const AppWrapper({List<_i17.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CustomTracingList]
class CustomTracingList extends _i17.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i18.Key? key,
    required String title,
    required String count,
    required String code,
    required bool isWorkOrder,
    List<_i17.PageRouteInfo>? children,
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

  static const _i17.PageInfo<CustomTracingListArgs> page =
      _i17.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
    required this.isWorkOrder,
  });

  final _i18.Key? key;

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
/// [_i3.EmptyRouter]
class EmptyRouter extends _i17.PageRouteInfo<void> {
  const EmptyRouter({List<_i17.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EmptySearchRouter]
class EmptySearchRouter extends _i17.PageRouteInfo<void> {
  const EmptySearchRouter({List<_i17.PageRouteInfo>? children})
      : super(
          EmptySearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreen extends _i17.PageRouteInfo<void> {
  const HomeScreen({List<_i17.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.IssueListScreen]
class IssueListScreen extends _i17.PageRouteInfo<IssueListScreenArgs> {
  IssueListScreen({
    _i18.Key? key,
    required String issueModuleCode,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          IssueListScreen.name,
          args: IssueListScreenArgs(
            key: key,
            issueModuleCode: issueModuleCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueListScreen';

  static const _i17.PageInfo<IssueListScreenArgs> page =
      _i17.PageInfo<IssueListScreenArgs>(name);
}

class IssueListScreenArgs {
  const IssueListScreenArgs({
    this.key,
    required this.issueModuleCode,
  });

  final _i18.Key? key;

  final String issueModuleCode;

  @override
  String toString() {
    return 'IssueListScreenArgs{key: $key, issueModuleCode: $issueModuleCode}';
  }
}

/// generated route for
/// [_i7.IssueSearchPage]
class IssueSearchRoute extends _i17.PageRouteInfo<void> {
  const IssueSearchRoute({List<_i17.PageRouteInfo>? children})
      : super(
          IssueSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueSearchRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IssueTracingList]
class IssueTracingList extends _i17.PageRouteInfo<void> {
  const IssueTracingList({List<_i17.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginScreen extends _i17.PageRouteInfo<void> {
  const LoginScreen({List<_i17.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewOrderScreen]
class NewOrderScreen extends _i17.PageRouteInfo<void> {
  const NewOrderScreen({List<_i17.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchScreen]
class SearchScreen extends _i17.PageRouteInfo<void> {
  const SearchScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i17.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashScreen]
class SplashScreen extends _i17.PageRouteInfo<void> {
  const SplashScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TestScreen]
class TestScreen extends _i17.PageRouteInfo<void> {
  const TestScreen({List<_i17.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WorkOrderListScreen]
class WorkOrderListScreen extends _i17.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i17.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.WorkOrderScreen]
class WorkOrderScreen extends _i17.PageRouteInfo<void> {
  const WorkOrderScreen({List<_i17.PageRouteInfo>? children})
      : super(
          WorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
