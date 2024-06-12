import 'dart:math';

import 'package:flutter/material.dart';

extension SpacingExtension on ThemeData {
  static final _spacing = Expando<Spacing>();
  Spacing get spacing =>
      _spacing[this] ??= Spacing(baseFontSize: textTheme.bodyMedium?.fontSize);
}

class Spacing {
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;

  factory Spacing({
    double? baseFontSize,
  }) {
    baseFontSize ??= 14;
    final double phi = (1 + sqrt(5)) / 2;
    return Spacing._internal(
      xs: baseFontSize / pow(phi, 2),
      s: baseFontSize / phi,
      m: baseFontSize,
      l: baseFontSize * phi,
      xl: baseFontSize * pow(phi, 2),
    );
  }
  Spacing._internal({
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });
}
