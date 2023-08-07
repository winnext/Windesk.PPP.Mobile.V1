// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i16;
import 'package:wm_ppp_4/feature/models/work_space/work_space_appendings.dart'
    as _i21;
import 'package:wm_ppp_4/feature/models/work_space/work_space_detail.dart'
    as _i22;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i15;
import 'package:wm_ppp_4/feature/route/empty_search_router.dart' as _i18;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i10;
import 'package:wm_ppp_4/product/screens/home/screens/detail_work_order/view/detail_work_order_screen.dart'
    as _i3;
import 'package:wm_ppp_4/product/screens/home/screens/pending_detail_work_order/pending_detail_work_order_screen.dart'
    as _i2;
import 'package:wm_ppp_4/product/screens/home/screens/search_work_order/view/search_work_order_screen.dart'
    as _i4;
import 'package:wm_ppp_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart'
    as _i23;
import 'package:wm_ppp_4/product/screens/home/screens/work_order_list/tabs/my_work_orders.dart'
    as _i5;
import 'package:wm_ppp_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart'
    as _i6;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i7;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_list_screen.dart'
    as _i14;
import 'package:wm_ppp_4/product/screens/issue/screens/issue_tracing_list_screen.dart'
    as _i13;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i12;
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/view/issue_search_page.dart'
    as _i17;
import 'package:wm_ppp_4/product/screens/search/view/search_screen.dart'
    as _i11;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i8;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i9;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    PendingDetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<PendingDetailWorkOrderScreenArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PendingDetailWorkOrderScreen(
          key: args.key,
          workSpacePendiks: args.workSpacePendiks,
        ),
      );
    },
    DetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<DetailWorkOrderScreenArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DetailWorkOrderScreen(
          key: args.key,
          workSpaceDetail: args.workSpaceDetail,
        ),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchWorkOrderScreen(),
      );
    },
    MyWorkOrders.name: (routeData) {
      final args = routeData.argsAs<MyWorkOrdersArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MyWorkOrders(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WorkOrderListScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TestScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NewOrderScreen(),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.IssueTracingList(),
      );
    },
    IssueList.name: (routeData) {
      final args = routeData.argsAs<IssueListArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.IssueList(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.EmptyRouter(),
      );
    },
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.CustomTracingList(
          key: args.key,
          title: args.title,
          count: args.count,
          code: args.code,
        ),
      );
    },
    IssueSearchRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.IssueSearchPage(),
      );
    },
    EmptySearchRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.EmptySearchRouter(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i19.PageRouteInfo<void> {
  const AppWrapper({List<_i19.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PendingDetailWorkOrderScreen]
class PendingDetailWorkOrderScreen
    extends _i19.PageRouteInfo<PendingDetailWorkOrderScreenArgs> {
  PendingDetailWorkOrderScreen({
    _i20.Key? key,
    required _i21.WorkSpacePendiks workSpacePendiks,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PendingDetailWorkOrderScreen.name,
          args: PendingDetailWorkOrderScreenArgs(
            key: key,
            workSpacePendiks: workSpacePendiks,
          ),
          initialChildren: children,
        );

  static const String name = 'PendingDetailWorkOrderScreen';

  static const _i19.PageInfo<PendingDetailWorkOrderScreenArgs> page =
      _i19.PageInfo<PendingDetailWorkOrderScreenArgs>(name);
}

class PendingDetailWorkOrderScreenArgs {
  const PendingDetailWorkOrderScreenArgs({
    this.key,
    required this.workSpacePendiks,
  });

  final _i20.Key? key;

  final _i21.WorkSpacePendiks workSpacePendiks;

  @override
  String toString() {
    return 'PendingDetailWorkOrderScreenArgs{key: $key, workSpacePendiks: $workSpacePendiks}';
  }
}

/// generated route for
/// [_i3.DetailWorkOrderScreen]
class DetailWorkOrderScreen
    extends _i19.PageRouteInfo<DetailWorkOrderScreenArgs> {
  DetailWorkOrderScreen({
    _i20.Key? key,
    required _i22.WorkSpaceDetail workSpaceDetail,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DetailWorkOrderScreen.name,
          args: DetailWorkOrderScreenArgs(
            key: key,
            workSpaceDetail: workSpaceDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWorkOrderScreen';

  static const _i19.PageInfo<DetailWorkOrderScreenArgs> page =
      _i19.PageInfo<DetailWorkOrderScreenArgs>(name);
}

class DetailWorkOrderScreenArgs {
  const DetailWorkOrderScreenArgs({
    this.key,
    required this.workSpaceDetail,
  });

  final _i20.Key? key;

  final _i22.WorkSpaceDetail workSpaceDetail;

  @override
  String toString() {
    return 'DetailWorkOrderScreenArgs{key: $key, workSpaceDetail: $workSpaceDetail}';
  }
}

/// generated route for
/// [_i4.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i19.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i19.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MyWorkOrders]
class MyWorkOrders extends _i19.PageRouteInfo<MyWorkOrdersArgs> {
  MyWorkOrders({
    _i20.Key? key,
    required _i23.WorkOrderListProvider provider,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          MyWorkOrders.name,
          args: MyWorkOrdersArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkOrders';

  static const _i19.PageInfo<MyWorkOrdersArgs> page =
      _i19.PageInfo<MyWorkOrdersArgs>(name);
}

class MyWorkOrdersArgs {
  const MyWorkOrdersArgs({
    this.key,
    required this.provider,
  });

  final _i20.Key? key;

  final _i23.WorkOrderListProvider provider;

  @override
  String toString() {
    return 'MyWorkOrdersArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [_i6.WorkOrderListScreen]
class WorkOrderListScreen extends _i19.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i19.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreen extends _i19.PageRouteInfo<void> {
  const HomeScreen({List<_i19.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreen extends _i19.PageRouteInfo<void> {
  const SplashScreen({List<_i19.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TestScreen]
class TestScreen extends _i19.PageRouteInfo<void> {
  const TestScreen({List<_i19.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginScreen extends _i19.PageRouteInfo<void> {
  const LoginScreen({List<_i19.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchScreen]
class SearchScreen extends _i19.PageRouteInfo<void> {
  const SearchScreen({List<_i19.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewOrderScreen]
class NewOrderScreen extends _i19.PageRouteInfo<void> {
  const NewOrderScreen({List<_i19.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.IssueTracingList]
class IssueTracingList extends _i19.PageRouteInfo<void> {
  const IssueTracingList({List<_i19.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.IssueList]
class IssueList extends _i19.PageRouteInfo<IssueListArgs> {
  IssueList({
    _i20.Key? key,
    required String issueModuleCode,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          IssueList.name,
          args: IssueListArgs(
            key: key,
            issueModuleCode: issueModuleCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueList';

  static const _i19.PageInfo<IssueListArgs> page =
      _i19.PageInfo<IssueListArgs>(name);
}

class IssueListArgs {
  const IssueListArgs({
    this.key,
    required this.issueModuleCode,
  });

  final _i20.Key? key;

  final String issueModuleCode;

  @override
  String toString() {
    return 'IssueListArgs{key: $key, issueModuleCode: $issueModuleCode}';
  }
}

/// generated route for
/// [_i15.EmptyRouter]
class EmptyRouter extends _i19.PageRouteInfo<void> {
  const EmptyRouter({List<_i19.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.CustomTracingList]
class CustomTracingList extends _i19.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i20.Key? key,
    required String title,
    required String count,
    required String code,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<CustomTracingListArgs> page =
      _i19.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
  });

  final _i20.Key? key;

  final String title;

  final String count;

  final String code;

  @override
  String toString() {
    return 'CustomTracingListArgs{key: $key, title: $title, count: $count, code: $code}';
  }
}

/// generated route for
/// [_i17.IssueSearchPage]
class IssueSearchRoute extends _i19.PageRouteInfo<void> {
  const IssueSearchRoute({List<_i19.PageRouteInfo>? children})
      : super(
          IssueSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueSearchRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.EmptySearchRouter]
class EmptySearchRouter extends _i19.PageRouteInfo<void> {
  const EmptySearchRouter({List<_i19.PageRouteInfo>? children})
      : super(
          EmptySearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}