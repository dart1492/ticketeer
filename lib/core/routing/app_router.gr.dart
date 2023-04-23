// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:ticketeer/features/main_bottom_bar/presentation/main_bottom_bar_screen.dart'
    as _i1;
import 'package:ticketeer/features/welcome/welcome_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainBottomBarRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainBottomBarScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainBottomBarScreen]
class MainBottomBarRoute extends _i3.PageRouteInfo<void> {
  const MainBottomBarRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainBottomBarRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeRoute extends _i3.PageRouteInfo<void> {
  const WelcomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
