import 'package:dio/dio.dart';
import 'package:ticketeer/core/error/failure.dart';

/// Handles the [error] object - if it is a DioError converts it into
/// a failure wth DioError message.
///
/// If [error ] is not a DioError than it just gets converted into regular
///  Failure
Future<Failure> errorHandler(Object error, Failure? defaultFailure) async {
  try {
    // error when Dio request has failed
    if (error is DioError) {
      if (error.response != null) {
        final String? serverError =
            // ignore: avoid_dynamic_calls
            error.response?.data['errorMessage'];
        return Failure(
          errorMessage: serverError ??
              "Sorry, we cannot process your request at the moment.",
        );
      }
    }

    // NetworkInfo networkInfo = sl();
    // if (!(await networkInfo.isConnected)) {
    //   return InternetConnectionFailure();
    // }

    return defaultFailure!;
  } catch (err) {
    return Failure();
  }
}
