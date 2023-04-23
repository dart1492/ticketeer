import 'package:auto_route/auto_route.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart' as gr;

@AutoRouterConfig(replaceInRouteName: "Screen,Route")

/// This class controls all routes, created by the build-runner.
/// Here I setup, nested routes, transition animations etc.
class AppRouter extends gr.$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: gr.MainBottomBarRoute.page,
          children: [
            AutoRoute(page: gr.HomeRoute.page),
            AutoRoute(page: gr.ProfileRoute.page),
            AutoRoute(page: gr.UserTicketsRoute.page),
          ],
        ),
        AutoRoute(
          page: gr.WelcomeRoute.page,
        ),
      ];
}
