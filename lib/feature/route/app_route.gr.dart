// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i1;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i2;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i3;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i4;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_list_screen.dart'
    as _i5;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_tracing_list_screen.dart'
    as _i6;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i7;
import 'package:wm_ppp_4/product/screens/search/search_screen.dart' as _i8;
import 'package:wm_ppp_4/product/screens/search_work_order/view/search_work_order_screen.dart'
    as _i13;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i9;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i10;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_screen.dart'
    as _i12;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i11;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CustomTracingList(
          key: args.key,
          title: args.title,
          count: args.count,
          code: args.code,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouter(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    IssueList.name: (routeData) {
      final args = routeData.argsAs<IssueListArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.IssueList(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
        ),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.IssueTracingList(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TestScreen(),
      );
    },
    AppWrapper.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.AppWrapper(),
      );
    },
    WorkOrderScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.WorkOrderScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SearchWorkOrderScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomTracingList]
class CustomTracingList extends _i14.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i15.Key? key,
    required String title,
    required String count,
    required String code,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CustomTracingList.name,
          args: CustomTracingListArgs(
            key: key,
            title: title,
            count: count,
            code: code,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomTracingList';

  static const _i14.PageInfo<CustomTracingListArgs> page =
      _i14.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
  });

  final _i15.Key? key;

  final String title;

  final String count;

  final String code;

  @override
  String toString() {
    return 'CustomTracingListArgs{key: $key, title: $title, count: $count, code: $code}';
  }
}

/// generated route for
/// [_i2.EmptyRouter]
class EmptyRouter extends _i14.PageRouteInfo<void> {
  const EmptyRouter({List<_i14.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i14.PageRouteInfo<void> {
  const LoginScreen({List<_i14.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i14.PageRouteInfo<void> {
  const HomeScreen({List<_i14.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.IssueList]
class IssueList extends _i14.PageRouteInfo<IssueListArgs> {
  IssueList({
    _i15.Key? key,
    required String issueModuleCode,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          IssueList.name,
          args: IssueListArgs(
            key: key,
            issueModuleCode: issueModuleCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueList';

  static const _i14.PageInfo<IssueListArgs> page =
      _i14.PageInfo<IssueListArgs>(name);
}

class IssueListArgs {
  const IssueListArgs({
    this.key,
    required this.issueModuleCode,
  });

  final _i15.Key? key;

  final String issueModuleCode;

  @override
  String toString() {
    return 'IssueListArgs{key: $key, issueModuleCode: $issueModuleCode}';
  }
}

/// generated route for
/// [_i6.IssueTracingList]
class IssueTracingList extends _i14.PageRouteInfo<void> {
  const IssueTracingList({List<_i14.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewOrderScreen]
class NewOrderScreen extends _i14.PageRouteInfo<void> {
  const NewOrderScreen({List<_i14.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchScreen]
class SearchScreen extends _i14.PageRouteInfo<void> {
  const SearchScreen({List<_i14.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashScreen extends _i14.PageRouteInfo<void> {
  const SplashScreen({List<_i14.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TestScreen]
class TestScreen extends _i14.PageRouteInfo<void> {
  const TestScreen({List<_i14.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.AppWrapper]
class AppWrapper extends _i14.PageRouteInfo<void> {
  const AppWrapper({List<_i14.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.WorkOrderScreen]
class WorkOrderScreen extends _i14.PageRouteInfo<void> {
  const WorkOrderScreen({List<_i14.PageRouteInfo>? children})
      : super(
          WorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i14.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i14.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
