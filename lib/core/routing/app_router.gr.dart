// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:ticketeer/core/routing/app_router.dart' as _i1;
import 'package:ticketeer/features/auth/presentation/views/otp_screen.dart'
    as _i2;
import 'package:ticketeer/features/auth/presentation/views/phone_screen.dart'
    as _i3;
import 'package:ticketeer/features/full_movie/presentation/views/comments_screen/comments_screen.dart'
    as _i4;
import 'package:ticketeer/features/full_movie/presentation/views/full_movie_screen/full_movie_screen.dart'
    as _i5;
import 'package:ticketeer/features/home_movies/domain/entities/movie.dart'
    as _i17;
import 'package:ticketeer/features/home_movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart'
    as _i18;
import 'package:ticketeer/features/home_movies/presentation/views/movies_filters_screen/movie_filters_screen.dart'
    as _i6;
import 'package:ticketeer/features/home_movies/presentation/views/movies_screen/movies_screen.dart'
    as _i7;
import 'package:ticketeer/features/main_bottom_bar/presentation/main_bottom_bar_screen.dart'
    as _i8;
import 'package:ticketeer/features/profile/presentation/views/profile_screen.dart'
    as _i9;
import 'package:ticketeer/features/session/domain/entities/session.dart'
    as _i19;
import 'package:ticketeer/features/session/presentation/views/all_sessions_screen/all_sessions_screen.dart'
    as _i10;
import 'package:ticketeer/features/session/presentation/views/payment_screen/payment_screen.dart'
    as _i11;
import 'package:ticketeer/features/session/presentation/views/room_screen/room_screen.dart'
    as _i12;
import 'package:ticketeer/features/user_tickets/presentation/views/user_tickets_screen.dart'
    as _i13;
import 'package:ticketeer/features/welcome/welcome_screen.dart' as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    HomeRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EmptyHomeMoviesScreen(),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OTPScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    PhoneRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PhoneScreen(),
      );
    },
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CommentsScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    FullMovieRoute.name: (routeData) {
      final args = routeData.argsAs<FullMovieRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.FullMovieScreen(
          key: args.key,
          movieObj: args.movieObj,
        ),
      );
    },
    MovieFiltersRoute.name: (routeData) {
      final args = routeData.argsAs<MovieFiltersRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MovieFiltersScreen(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    MoviesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MoviesScreen(),
      );
    },
    MainBottomBarRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainBottomBarScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    SessionRoute.name: (routeData) {
      final args = routeData.argsAs<SessionRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SessionScreen(
          key: args.key,
          movieObj: args.movieObj,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.PaymentScreen(
          key: args.key,
          seatIds: args.seatIds,
          sessionId: args.sessionId,
        ),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RoomScreen(
          key: args.key,
          movieObj: args.movieObj,
          sessionObj: args.sessionObj,
        ),
      );
    },
    UserTicketsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.UserTicketsScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyHomeMoviesScreen]
class HomeRouter extends _i15.PageRouteInfo<void> {
  const HomeRouter({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OTPScreen]
class OTPRoute extends _i15.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i16.Key? key,
    required String phoneNumber,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i15.PageInfo<OTPRouteArgs> page =
      _i15.PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i16.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i3.PhoneScreen]
class PhoneRoute extends _i15.PageRouteInfo<void> {
  const PhoneRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CommentsScreen]
class CommentsRoute extends _i15.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    _i16.Key? key,
    required int movieId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CommentsRoute.name,
          args: CommentsRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const _i15.PageInfo<CommentsRouteArgs> page =
      _i15.PageInfo<CommentsRouteArgs>(name);
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.movieId,
  });

  final _i16.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i5.FullMovieScreen]
class FullMovieRoute extends _i15.PageRouteInfo<FullMovieRouteArgs> {
  FullMovieRoute({
    _i16.Key? key,
    required _i17.Movie movieObj,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          FullMovieRoute.name,
          args: FullMovieRouteArgs(
            key: key,
            movieObj: movieObj,
          ),
          initialChildren: children,
        );

  static const String name = 'FullMovieRoute';

  static const _i15.PageInfo<FullMovieRouteArgs> page =
      _i15.PageInfo<FullMovieRouteArgs>(name);
}

class FullMovieRouteArgs {
  const FullMovieRouteArgs({
    this.key,
    required this.movieObj,
  });

  final _i16.Key? key;

  final _i17.Movie movieObj;

  @override
  String toString() {
    return 'FullMovieRouteArgs{key: $key, movieObj: $movieObj}';
  }
}

/// generated route for
/// [_i6.MovieFiltersScreen]
class MovieFiltersRoute extends _i15.PageRouteInfo<MovieFiltersRouteArgs> {
  MovieFiltersRoute({
    _i16.Key? key,
    required _i18.HomeMoviesCubit cubit,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MovieFiltersRoute.name,
          args: MovieFiltersRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieFiltersRoute';

  static const _i15.PageInfo<MovieFiltersRouteArgs> page =
      _i15.PageInfo<MovieFiltersRouteArgs>(name);
}

class MovieFiltersRouteArgs {
  const MovieFiltersRouteArgs({
    this.key,
    required this.cubit,
  });

  final _i16.Key? key;

  final _i18.HomeMoviesCubit cubit;

  @override
  String toString() {
    return 'MovieFiltersRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [_i7.MoviesScreen]
class MoviesRoute extends _i15.PageRouteInfo<void> {
  const MoviesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainBottomBarScreen]
class MainBottomBarRoute extends _i15.PageRouteInfo<void> {
  const MainBottomBarRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainBottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainBottomBarRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SessionScreen]
class SessionRoute extends _i15.PageRouteInfo<SessionRouteArgs> {
  SessionRoute({
    _i16.Key? key,
    required _i17.Movie movieObj,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SessionRoute.name,
          args: SessionRouteArgs(
            key: key,
            movieObj: movieObj,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionRoute';

  static const _i15.PageInfo<SessionRouteArgs> page =
      _i15.PageInfo<SessionRouteArgs>(name);
}

class SessionRouteArgs {
  const SessionRouteArgs({
    this.key,
    required this.movieObj,
  });

  final _i16.Key? key;

  final _i17.Movie movieObj;

  @override
  String toString() {
    return 'SessionRouteArgs{key: $key, movieObj: $movieObj}';
  }
}

/// generated route for
/// [_i11.PaymentScreen]
class PaymentRoute extends _i15.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({
    _i16.Key? key,
    required List<int> seatIds,
    required int sessionId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PaymentRoute.name,
          args: PaymentRouteArgs(
            key: key,
            seatIds: seatIds,
            sessionId: sessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i15.PageInfo<PaymentRouteArgs> page =
      _i15.PageInfo<PaymentRouteArgs>(name);
}

class PaymentRouteArgs {
  const PaymentRouteArgs({
    this.key,
    required this.seatIds,
    required this.sessionId,
  });

  final _i16.Key? key;

  final List<int> seatIds;

  final int sessionId;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, seatIds: $seatIds, sessionId: $sessionId}';
  }
}

/// generated route for
/// [_i12.RoomScreen]
class RoomRoute extends _i15.PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    _i16.Key? key,
    required _i17.Movie movieObj,
    required _i19.Session sessionObj,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            movieObj: movieObj,
            sessionObj: sessionObj,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const _i15.PageInfo<RoomRouteArgs> page =
      _i15.PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.movieObj,
    required this.sessionObj,
  });

  final _i16.Key? key;

  final _i17.Movie movieObj;

  final _i19.Session sessionObj;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, movieObj: $movieObj, sessionObj: $sessionObj}';
  }
}

/// generated route for
/// [_i13.UserTicketsScreen]
class UserTicketsRoute extends _i15.PageRouteInfo<void> {
  const UserTicketsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          UserTicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTicketsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WelcomeScreen]
class WelcomeRoute extends _i15.PageRouteInfo<void> {
  const WelcomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
