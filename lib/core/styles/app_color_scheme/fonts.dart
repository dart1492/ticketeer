// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Fonts {
  final Color main;
  final Color secondary;
  final Color reversed;

  Fonts({
    required this.main,
    required this.secondary,
    required this.reversed,
  });

  Fonts lerp(Fonts other, double t) {
    return Fonts(
      main: Color.lerp(main, other.main, t) ?? main,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      reversed: Color.lerp(reversed, other.reversed, t) ?? reversed,
    );
  }
}
