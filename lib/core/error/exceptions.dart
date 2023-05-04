import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ticketeer/core/error/error_model.dart';
import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/locator.dart';

/// Handles the [error] object - if it is a DioError converts it into
/// a failure wth DioError message.
///
/// If [error ] is not a DioError than it just gets converted into default
///  Failure
Future<Failure> errorHandler(Object error, Failure? defaultFailure) async {
  try {
    // error when Dio request has failed
    if (error is DioError) {
      sl<Logger>().e(error.response!.data, StackTrace);
      if (error.response != null) {
        final response = error.response!;
        // for validation errors
        if (response.statusCode == 422) {
          final List<dynamic> validationErrorsDynamic =
              // ignore: avoid_dynamic_calls
              response.data['data'] as List<dynamic>;

          final List<ErrorModel> validationErrors = [];

          for (int i = 0; i < validationErrorsDynamic.length; i++) {
            validationErrors.add(
              ErrorModel.fromMap(
                validationErrorsDynamic[i],
              ),
            );
          }

          return Failure(
            errorData: validationErrors,
            errorCode: 422,
            errorMessage: "Validation error",
          );
        } else {
          // ignore: avoid_dynamic_calls
          return Failure(errorMessage: response.data['data']);
        }
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
