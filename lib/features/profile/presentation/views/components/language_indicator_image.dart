import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/static_elements/custom_container.dart';
import 'package:ticketeer/core/constants/image_names.dart';
import 'package:ticketeer/core/constants/object_constants.dart';

/// Image that gets shown depending on current locale
class LanguageIndicatorImage extends StatelessWidget {
  /// Image that gets shown depending on current locale
  const LanguageIndicatorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Builder(
        builder: (context) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  context.locale == englishLocale
                      ? ImageNames.english
                      : ImageNames.ukrainian,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
