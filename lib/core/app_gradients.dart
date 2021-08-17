import 'dart:math';
import 'dart:ui';

import 'package:earthquake_app/core/utils/HexColor.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    HexColor("#5D3CD5"),
    HexColor("#5839CA"),
    HexColor("#3E2991"),
    HexColor("#1E1549"),
  ], stops: [
    0.0,
    0.400,
    0.550,
    0.695
  ], transform: GradientRotation(3.139599 * pi));
}
