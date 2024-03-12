// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:flutter/material.dart' as _i34;
import 'package:wm_ppp_4/feature/components/cards/custom_tracing_list_card.dart'
    as _i7;
import 'package:wm_ppp_4/feature/route/empty_router.dart' as _i8;
import 'package:wm_ppp_4/feature/route/empty_search_router.dart' as _i9;
import 'package:wm_ppp_4/product/screens/auth/view/login_screen.dart' as _i19;
import 'package:wm_ppp_4/product/screens/home/view/home_screen.dart' as _i10;
import 'package:wm_ppp_4/product/screens/issue/view/issue_activities_screen.dart'
    as _i11;
import 'package:wm_ppp_4/product/screens/issue/view/issue_detail_screen.dart'
    as _i12;
import 'package:wm_ppp_4/product/screens/issue/view/issue_files_screen.dart'
    as _i13;
import 'package:wm_ppp_4/product/screens/issue/view/issue_list_screen.dart'
    as _i14;
import 'package:wm_ppp_4/product/screens/issue/view/issue_notes_screen.dart'
    as _i15;
import 'package:wm_ppp_4/product/screens/issue/view/issue_summary_screen.dart'
    as _i17;
import 'package:wm_ppp_4/product/screens/issue/view/issue_tracing_list.dart'
    as _i18;
import 'package:wm_ppp_4/product/screens/new_notif/case_complaint.dart' as _i5;
import 'package:wm_ppp_4/product/screens/new_notif/case_complaint_detail.dart'
    as _i4;
import 'package:wm_ppp_4/product/screens/new_notif/case_complaint_search.dart'
    as _i6;
import 'package:wm_ppp_4/product/screens/new_notif/new_notif_page.dart' as _i20;
import 'package:wm_ppp_4/product/screens/new_notif/new_notif_screen.dart'
    as _i21;
import 'package:wm_ppp_4/product/screens/new_notif/suggestion.dart' as _i27;
import 'package:wm_ppp_4/product/screens/new_order/new_order_screen.dart'
    as _i22;
import 'package:wm_ppp_4/product/screens/search/screens/asset_search/provider/asset_search_provider.dart'
    as _i35;
import 'package:wm_ppp_4/product/screens/search/screens/asset_search/view/asset_search_list.dart'
    as _i2;
import 'package:wm_ppp_4/product/screens/search/screens/asset_search/view/asset_search_page.dart'
    as _i3;
import 'package:wm_ppp_4/product/screens/search/screens/issue_search/view/issue_search_page.dart'
    as _i16;
import 'package:wm_ppp_4/product/screens/search/screens/space_search/view/space_search_page.dart'
    as _i25;
import 'package:wm_ppp_4/product/screens/search/screens/wo_search/view/wo_search_page.dart'
    as _i29;
import 'package:wm_ppp_4/product/screens/search/search_screen.dart' as _i23;
import 'package:wm_ppp_4/product/screens/search_work_order/view/search_work_order_screen.dart'
    as _i24;
import 'package:wm_ppp_4/product/screens/splash/splash_screen.dart' as _i26;
import 'package:wm_ppp_4/product/screens/test/view/test_screen.dart' as _i28;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_list_screen.dart'
    as _i31;
import 'package:wm_ppp_4/product/screens/work_order/view/work_order_main_screen.dart'
    as _i32;
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/view/work_order_detail_screen.dart'
    as _i30;
import 'package:wm_ppp_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i33.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    AssetSearchListRoute.name: (routeData) {
      final args = routeData.argsAs<AssetSearchListRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AssetSearchListPage(
          key: args.key,
          assetSearchProviderx: args.assetSearchProviderx,
        ),
      );
    },
    AssetSearchRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AssetSearchPage(),
      );
    },
    CaseCompDetail.name: (routeData) {
      final args = routeData.argsAs<CaseCompDetailArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CaseCompDetail(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    CaseComplaintRoute.name: (routeData) {
      final args = routeData.argsAs<CaseComplaintRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CaseComplaintPage(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    CaseSearch.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CaseSearch(),
      );
    },
    CustomTracingList.name: (routeData) {
      final args = routeData.argsAs<CustomTracingListArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CustomTracingList(
          key: args.key,
          title: args.title,
          count: args.count,
          code: args.code,
          isWorkOrder: args.isWorkOrder,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouter(),
      );
    },
    EmptySearchRouter.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptySearchRouter(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    IssueActivitiesScreen.name: (routeData) {
      final args = routeData.argsAs<IssueActivitiesScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.IssueActivitiesScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueDetailScreen.name: (routeData) {
      final args = routeData.argsAs<IssueDetailScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.IssueDetailScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueFilesScreen.name: (routeData) {
      final args = routeData.argsAs<IssueFilesScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.IssueFilesScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueListScreen.name: (routeData) {
      final args = routeData.argsAs<IssueListScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.IssueListScreen(
          key: args.key,
          issueModuleCode: args.issueModuleCode,
          issueModuleName: args.issueModuleName,
        ),
      );
    },
    IssueNotesScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.IssueNotesScreen(),
      );
    },
    IssueSearchRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.IssueSearchPage(),
      );
    },
    IssueSummaryScreen.name: (routeData) {
      final args = routeData.argsAs<IssueSummaryScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.IssueSummaryScreen(
          key: args.key,
          issueCode: args.issueCode,
        ),
      );
    },
    IssueTracingList.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.IssueTracingList(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.LoginScreen(),
      );
    },
    NewNotifRoute.name: (routeData) {
      final args = routeData.argsAs<NewNotifRouteArgs>(
          orElse: () => const NewNotifRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.NewNotifPage(key: args.key),
      );
    },
    NewNotifScreen.name: (routeData) {
      final args = routeData.argsAs<NewNotifScreenArgs>(
          orElse: () => const NewNotifScreenArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.NewNotifScreen(key: args.key),
      );
    },
    NewOrderScreen.name: (routeData) {
      final args = routeData.argsAs<NewOrderScreenArgs>(
          orElse: () => const NewOrderScreenArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.NewOrderScreen(
          key: args.key,
          photos: args.photos,
          b64s: args.b64s,
        ),
      );
    },
    SearchScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SearchScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SearchWorkOrderScreen(),
      );
    },
    SpaceSearchRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SpaceSearchPage(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SplashScreen(),
      );
    },
    Suggestion.name: (routeData) {
      final args = routeData.argsAs<SuggestionArgs>(
          orElse: () => const SuggestionArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.Suggestion(key: args.key),
      );
    },
    TestScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.TestScreen(),
      );
    },
    WoSearchRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.WoSearchPage(),
      );
    },
    WorkOrderDetailScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderDetailScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.WorkOrderDetailScreen(
          key: args.key,
          workorderCode: args.workorderCode,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderListScreenArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.WorkOrderListScreen(
          key: args.key,
          workOrderCode: args.workOrderCode,
          workOrderName: args.workOrderName,
        ),
      );
    },
    WorkOrderMainScreen.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.WorkOrderMainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i33.PageRouteInfo<void> {
  const AppWrapper({List<_i33.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AssetSearchListPage]
class AssetSearchListRoute
    extends _i33.PageRouteInfo<AssetSearchListRouteArgs> {
  AssetSearchListRoute({
    _i34.Key? key,
    required _i35.AssetSearchProvider assetSearchProviderx,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          AssetSearchListRoute.name,
          args: AssetSearchListRouteArgs(
            key: key,
            assetSearchProviderx: assetSearchProviderx,
          ),
          initialChildren: children,
        );

  static const String name = 'AssetSearchListRoute';

  static const _i33.PageInfo<AssetSearchListRouteArgs> page =
      _i33.PageInfo<AssetSearchListRouteArgs>(name);
}

class AssetSearchListRouteArgs {
  const AssetSearchListRouteArgs({
    this.key,
    required this.assetSearchProviderx,
  });

  final _i34.Key? key;

  final _i35.AssetSearchProvider assetSearchProviderx;

  @override
  String toString() {
    return 'AssetSearchListRouteArgs{key: $key, assetSearchProviderx: $assetSearchProviderx}';
  }
}

/// generated route for
/// [_i3.AssetSearchPage]
class AssetSearchRoute extends _i33.PageRouteInfo<void> {
  const AssetSearchRoute({List<_i33.PageRouteInfo>? children})
      : super(
          AssetSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssetSearchRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CaseCompDetail]
class CaseCompDetail extends _i33.PageRouteInfo<CaseCompDetailArgs> {
  CaseCompDetail({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          CaseCompDetail.name,
          args: CaseCompDetailArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'CaseCompDetail';

  static const _i33.PageInfo<CaseCompDetailArgs> page =
      _i33.PageInfo<CaseCompDetailArgs>(name);
}

class CaseCompDetailArgs {
  const CaseCompDetailArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'CaseCompDetailArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i5.CaseComplaintPage]
class CaseComplaintRoute extends _i33.PageRouteInfo<CaseComplaintRouteArgs> {
  CaseComplaintRoute({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          CaseComplaintRoute.name,
          args: CaseComplaintRouteArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'CaseComplaintRoute';

  static const _i33.PageInfo<CaseComplaintRouteArgs> page =
      _i33.PageInfo<CaseComplaintRouteArgs>(name);
}

class CaseComplaintRouteArgs {
  const CaseComplaintRouteArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'CaseComplaintRouteArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i6.CaseSearch]
class CaseSearch extends _i33.PageRouteInfo<void> {
  const CaseSearch({List<_i33.PageRouteInfo>? children})
      : super(
          CaseSearch.name,
          initialChildren: children,
        );

  static const String name = 'CaseSearch';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CustomTracingList]
class CustomTracingList extends _i33.PageRouteInfo<CustomTracingListArgs> {
  CustomTracingList({
    _i34.Key? key,
    required String title,
    required String count,
    required String code,
    required bool isWorkOrder,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<CustomTracingListArgs> page =
      _i33.PageInfo<CustomTracingListArgs>(name);
}

class CustomTracingListArgs {
  const CustomTracingListArgs({
    this.key,
    required this.title,
    required this.count,
    required this.code,
    required this.isWorkOrder,
  });

  final _i34.Key? key;

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
/// [_i8.EmptyRouter]
class EmptyRouter extends _i33.PageRouteInfo<void> {
  const EmptyRouter({List<_i33.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EmptySearchRouter]
class EmptySearchRouter extends _i33.PageRouteInfo<void> {
  const EmptySearchRouter({List<_i33.PageRouteInfo>? children})
      : super(
          EmptySearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRouter';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreen extends _i33.PageRouteInfo<void> {
  const HomeScreen({List<_i33.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i11.IssueActivitiesScreen]
class IssueActivitiesScreen
    extends _i33.PageRouteInfo<IssueActivitiesScreenArgs> {
  IssueActivitiesScreen({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          IssueActivitiesScreen.name,
          args: IssueActivitiesScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueActivitiesScreen';

  static const _i33.PageInfo<IssueActivitiesScreenArgs> page =
      _i33.PageInfo<IssueActivitiesScreenArgs>(name);
}

class IssueActivitiesScreenArgs {
  const IssueActivitiesScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueActivitiesScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i12.IssueDetailScreen]
class IssueDetailScreen extends _i33.PageRouteInfo<IssueDetailScreenArgs> {
  IssueDetailScreen({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          IssueDetailScreen.name,
          args: IssueDetailScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueDetailScreen';

  static const _i33.PageInfo<IssueDetailScreenArgs> page =
      _i33.PageInfo<IssueDetailScreenArgs>(name);
}

class IssueDetailScreenArgs {
  const IssueDetailScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueDetailScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i13.IssueFilesScreen]
class IssueFilesScreen extends _i33.PageRouteInfo<IssueFilesScreenArgs> {
  IssueFilesScreen({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          IssueFilesScreen.name,
          args: IssueFilesScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueFilesScreen';

  static const _i33.PageInfo<IssueFilesScreenArgs> page =
      _i33.PageInfo<IssueFilesScreenArgs>(name);
}

class IssueFilesScreenArgs {
  const IssueFilesScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueFilesScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i14.IssueListScreen]
class IssueListScreen extends _i33.PageRouteInfo<IssueListScreenArgs> {
  IssueListScreen({
    _i34.Key? key,
    required String issueModuleCode,
    required String issueModuleName,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          IssueListScreen.name,
          args: IssueListScreenArgs(
            key: key,
            issueModuleCode: issueModuleCode,
            issueModuleName: issueModuleName,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueListScreen';

  static const _i33.PageInfo<IssueListScreenArgs> page =
      _i33.PageInfo<IssueListScreenArgs>(name);
}

class IssueListScreenArgs {
  const IssueListScreenArgs({
    this.key,
    required this.issueModuleCode,
    required this.issueModuleName,
  });

  final _i34.Key? key;

  final String issueModuleCode;

  final String issueModuleName;

  @override
  String toString() {
    return 'IssueListScreenArgs{key: $key, issueModuleCode: $issueModuleCode, issueModuleName: $issueModuleName}';
  }
}

/// generated route for
/// [_i15.IssueNotesScreen]
class IssueNotesScreen extends _i33.PageRouteInfo<void> {
  const IssueNotesScreen({List<_i33.PageRouteInfo>? children})
      : super(
          IssueNotesScreen.name,
          initialChildren: children,
        );

  static const String name = 'IssueNotesScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i16.IssueSearchPage]
class IssueSearchRoute extends _i33.PageRouteInfo<void> {
  const IssueSearchRoute({List<_i33.PageRouteInfo>? children})
      : super(
          IssueSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'IssueSearchRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i17.IssueSummaryScreen]
class IssueSummaryScreen extends _i33.PageRouteInfo<IssueSummaryScreenArgs> {
  IssueSummaryScreen({
    _i34.Key? key,
    required String issueCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          IssueSummaryScreen.name,
          args: IssueSummaryScreenArgs(
            key: key,
            issueCode: issueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'IssueSummaryScreen';

  static const _i33.PageInfo<IssueSummaryScreenArgs> page =
      _i33.PageInfo<IssueSummaryScreenArgs>(name);
}

class IssueSummaryScreenArgs {
  const IssueSummaryScreenArgs({
    this.key,
    required this.issueCode,
  });

  final _i34.Key? key;

  final String issueCode;

  @override
  String toString() {
    return 'IssueSummaryScreenArgs{key: $key, issueCode: $issueCode}';
  }
}

/// generated route for
/// [_i18.IssueTracingList]
class IssueTracingList extends _i33.PageRouteInfo<void> {
  const IssueTracingList({List<_i33.PageRouteInfo>? children})
      : super(
          IssueTracingList.name,
          initialChildren: children,
        );

  static const String name = 'IssueTracingList';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i19.LoginScreen]
class LoginScreen extends _i33.PageRouteInfo<void> {
  const LoginScreen({List<_i33.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i20.NewNotifPage]
class NewNotifRoute extends _i33.PageRouteInfo<NewNotifRouteArgs> {
  NewNotifRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          NewNotifRoute.name,
          args: NewNotifRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewNotifRoute';

  static const _i33.PageInfo<NewNotifRouteArgs> page =
      _i33.PageInfo<NewNotifRouteArgs>(name);
}

class NewNotifRouteArgs {
  const NewNotifRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'NewNotifRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.NewNotifScreen]
class NewNotifScreen extends _i33.PageRouteInfo<NewNotifScreenArgs> {
  NewNotifScreen({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          NewNotifScreen.name,
          args: NewNotifScreenArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewNotifScreen';

  static const _i33.PageInfo<NewNotifScreenArgs> page =
      _i33.PageInfo<NewNotifScreenArgs>(name);
}

class NewNotifScreenArgs {
  const NewNotifScreenArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'NewNotifScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i22.NewOrderScreen]
class NewOrderScreen extends _i33.PageRouteInfo<NewOrderScreenArgs> {
  NewOrderScreen({
    _i34.Key? key,
    List<dynamic>? photos,
    List<dynamic>? b64s,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          NewOrderScreen.name,
          args: NewOrderScreenArgs(
            key: key,
            photos: photos,
            b64s: b64s,
          ),
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i33.PageInfo<NewOrderScreenArgs> page =
      _i33.PageInfo<NewOrderScreenArgs>(name);
}

class NewOrderScreenArgs {
  const NewOrderScreenArgs({
    this.key,
    this.photos,
    this.b64s,
  });

  final _i34.Key? key;

  final List<dynamic>? photos;

  final List<dynamic>? b64s;

  @override
  String toString() {
    return 'NewOrderScreenArgs{key: $key, photos: $photos, b64s: $b64s}';
  }
}

/// generated route for
/// [_i23.SearchScreen]
class SearchScreen extends _i33.PageRouteInfo<void> {
  const SearchScreen({List<_i33.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i33.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i33.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SpaceSearchPage]
class SpaceSearchRoute extends _i33.PageRouteInfo<void> {
  const SpaceSearchRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SpaceSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpaceSearchRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SplashScreen]
class SplashScreen extends _i33.PageRouteInfo<void> {
  const SplashScreen({List<_i33.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i27.Suggestion]
class Suggestion extends _i33.PageRouteInfo<SuggestionArgs> {
  Suggestion({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          Suggestion.name,
          args: SuggestionArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Suggestion';

  static const _i33.PageInfo<SuggestionArgs> page =
      _i33.PageInfo<SuggestionArgs>(name);
}

class SuggestionArgs {
  const SuggestionArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'SuggestionArgs{key: $key}';
  }
}

/// generated route for
/// [_i28.TestScreen]
class TestScreen extends _i33.PageRouteInfo<void> {
  const TestScreen({List<_i33.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i29.WoSearchPage]
class WoSearchRoute extends _i33.PageRouteInfo<void> {
  const WoSearchRoute({List<_i33.PageRouteInfo>? children})
      : super(
          WoSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'WoSearchRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i30.WorkOrderDetailScreen]
class WorkOrderDetailScreen
    extends _i33.PageRouteInfo<WorkOrderDetailScreenArgs> {
  WorkOrderDetailScreen({
    _i34.Key? key,
    required String workorderCode,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          WorkOrderDetailScreen.name,
          args: WorkOrderDetailScreenArgs(
            key: key,
            workorderCode: workorderCode,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkOrderDetailScreen';

  static const _i33.PageInfo<WorkOrderDetailScreenArgs> page =
      _i33.PageInfo<WorkOrderDetailScreenArgs>(name);
}

class WorkOrderDetailScreenArgs {
  const WorkOrderDetailScreenArgs({
    this.key,
    required this.workorderCode,
  });

  final _i34.Key? key;

  final String workorderCode;

  @override
  String toString() {
    return 'WorkOrderDetailScreenArgs{key: $key, workorderCode: $workorderCode}';
  }
}

/// generated route for
/// [_i31.WorkOrderListScreen]
class WorkOrderListScreen extends _i33.PageRouteInfo<WorkOrderListScreenArgs> {
  WorkOrderListScreen({
    _i34.Key? key,
    required String workOrderCode,
    required String workOrderName,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<WorkOrderListScreenArgs> page =
      _i33.PageInfo<WorkOrderListScreenArgs>(name);
}

class WorkOrderListScreenArgs {
  const WorkOrderListScreenArgs({
    this.key,
    required this.workOrderCode,
    required this.workOrderName,
  });

  final _i34.Key? key;

  final String workOrderCode;

  final String workOrderName;

  @override
  String toString() {
    return 'WorkOrderListScreenArgs{key: $key, workOrderCode: $workOrderCode, workOrderName: $workOrderName}';
  }
}

/// generated route for
/// [_i32.WorkOrderMainScreen]
class WorkOrderMainScreen extends _i33.PageRouteInfo<void> {
  const WorkOrderMainScreen({List<_i33.PageRouteInfo>? children})
      : super(
          WorkOrderMainScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderMainScreen';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}
