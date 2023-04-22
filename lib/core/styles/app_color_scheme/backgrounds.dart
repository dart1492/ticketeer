// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class Backgrounds {
  final Color main;
  final Color secondary;

  Backgrounds({
    required this.main,
    required this.secondary,
  });

  Backgrounds lerp(Backgrounds other, double t) {
    return Backgrounds(
      main: Color.lerp(main, other.main, t) ?? main,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
    );
  }
}
