import 'package:flutter/material.dart';

import '../constants.dart';

class TElavatedButtonTheme {
  TElavatedButtonTheme._();

  static final smallElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: kWhiteColor,
      backgroundColor: kBlueColor,
      side: const BorderSide(style: BorderStyle.none),
      padding: const EdgeInsets.symmetric(vertical: 5),
    ),
  );
}
