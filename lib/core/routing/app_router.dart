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
                CustomRoute(
                  transitionsBuilder: TransitionsBuilders.fadeIn,
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
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: gr.WelcomeRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          page: gr.PhoneRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
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
          maintainState: false,
          page: gr.SessionRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.RoomRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: gr.FullTicketRoute.page,
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
