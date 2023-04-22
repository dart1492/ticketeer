import 'package:auto_route/auto_route.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart' as gr;

@AutoRouterConfig(replaceInRouteName: "Screen,Route")

/// This class controls all routes, created by the build-runner.
/// Here I setup animations for routing, nested routes, etc.
class AppRouter extends gr.$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: gr.MainBottomBarRoute.page,
        ),
      ];
}
