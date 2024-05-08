import 'package:flutter/material.dart';

TextStyle heading({TextStyle? textStyle}) {
  return TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w900,
  ).merge(textStyle);
}

TextStyle smallHeading({TextStyle? textStyle}) {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ).merge(textStyle);
}

TextStyle normalText({TextStyle? textStyle}) {
  return TextStyle(
    fontSize: 14,
  ).merge(textStyle);
}

TextStyle buttonText({TextStyle? textStyle}) {
  return TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  ).merge(textStyle);
}
