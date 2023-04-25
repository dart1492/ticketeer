import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:ticketeer/core/error/exceptions.dart';
import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/locator.dart';

/// Typedef for Failable Future. It uses Either object from the dartz package.
/// Failable means that this is actually an
/// Either object between Failure and the successful response object.
///
/// Future means that this Either is wrapped in Future and can be awaited or
/// unawaited
typedef FutureFailable<T> = Future<Either<Failure, T>>;

/// Basically a try-catch wrapper for a request. Used to catch server errors
/// early and convert them into failures.
///
/// If the provided request throws - the error gets
/// caught and readdressed to errorHandler function.
///
/// If the provided request is successful - returns T (can by anything)
class RepositoryRequestHandler<T> {
  /// One and only method to use
  FutureFailable<T> call({
    Failure? defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      sl<Logger>().e(error);
      final failure = await errorHandler(error, defaultFailure);
      return Left(failure);
    }
  }
}
