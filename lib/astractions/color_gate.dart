import 'package:flutter/material.dart';

class ColorGate {
  final BuildContext context;
  final Color? defaultColor;
  final Color? darkModeColor;

  ColorGate({
    required this.context,
    this.defaultColor,
    this.darkModeColor = Colors.white,
  });

  Color? get color {
    return Theme.of(context).brightness == Brightness.dark
        ? darkModeColor
        : defaultColor;
  }
}
