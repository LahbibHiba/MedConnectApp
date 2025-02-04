import 'package:flutter/material.dart';

import '../constants.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();
  static final largeOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: kBlueColor,
      side: const BorderSide(color: kBlueColor, width: 2),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  );
  static final smallOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: kBlueColor,
      side: const BorderSide(color: kBlueColor, width: 2),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    ),
  );
}
