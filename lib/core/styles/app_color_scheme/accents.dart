// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class Accents {
  final Color purple;
  final Color red;
  final Color blue;
  final Color green;
  final Color gold;
  Accents({
    required this.purple,
    required this.red,
    required this.blue,
    required this.green,
    required this.gold,
  });

  Accents lerp(Accents other, double t) {
    return Accents(
      purple: Color.lerp(purple, other.purple, t) ?? purple,
      red: Color.lerp(red, other.red, t) ?? red,
      blue: Color.lerp(blue, other.blue, t) ?? blue,
      green: Color.lerp(green, other.green, t) ?? green,
      gold: Color.lerp(gold, other.gold, t) ?? gold,
    );
  }
}
