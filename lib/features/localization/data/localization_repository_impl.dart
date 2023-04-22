// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/localization/data/localization_datasource.dart';
import 'package:ticketeer/features/localization/domain/localization_repository.dart';

class LocalizationRepositoryImpl extends LocalizationRepository {
  LocalizationDatasource datasource;
  LocalizationRepositoryImpl(
    this.datasource,
  );
  @override
  FutureFailable<Locale?> getCurrentLocale() {
    return RepositoryRequestHandler<Locale?>()(
      request: () => datasource.getCurrentLocale(),
      defaultFailure: Failure(errorMessage: "Couldn't get current locale"),
    );
  }

  @override
  FutureFailable<void> setNewLocale(Locale newLocale) {
    return RepositoryRequestHandler<void>()(
      request: () => datasource.setNewLocale(newLocale),
      defaultFailure: Failure(
        errorMessage: "Couldn't set current locale",
      ),
    );
  }
}
