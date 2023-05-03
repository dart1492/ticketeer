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
          maintainState: true,
          children: [
            AutoRoute(
              page: gr.HomeRouter.page,
              maintainState: false,
              children: [
                AutoRoute(
                  page: gr.MoviesRoute.page,
                  path: '',
                  maintainState: true,
                ),
                AutoRoute(
                  page: gr.MovieFiltersRoute.page,
                ),
              ],
            ),
            AutoRoute(page: gr.ProfileRoute.page),
            AutoRoute(
              page: gr.UserTicketsRoute.page,
              maintainState: false,
              keepHistory: false,
            ),
          ],
        ),
        AutoRoute(
          page: gr.WelcomeRoute.page,
        ),
        AutoRoute(
          page: gr.PhoneRoute.page,
        ),
        AutoRoute(
          page: gr.OTPRoute.page,
        ),
        CustomRoute(
          page: gr.FullMovieRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.CommentsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.SessionRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.RoomRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.PaymentRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}

@RoutePage(name: 'HomeRouter')

/// Empty home page for nested navigation
class EmptyHomeMoviesScreen extends AutoRouter {}
