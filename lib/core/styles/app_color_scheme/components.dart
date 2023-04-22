// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class Components {
  final Blocks blocks;

  Components(this.blocks);

  Components lerp(Components other, double t) {
    return Components(blocks.lerp(other.blocks, t));
  }
}

class Blocks {
  final Color border;

  final Color background;
  Blocks({
    required this.border,
    required this.background,
  });

  Blocks lerp(Blocks other, double t) {
    return Blocks(
      border: Color.lerp(border, other.border, t) ?? border,
      background: Color.lerp(background, other.background, t) ?? background,
    );
  }
}
