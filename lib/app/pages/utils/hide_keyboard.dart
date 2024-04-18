import 'package:flutter/material.dart';

// Hides the keyboard.
void hideKeyboard(BuildContext context) {
  var currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
