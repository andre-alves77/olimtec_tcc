import 'package:flutter/material.dart';

class ThemeStore extends ValueNotifier<ThemeMode> {
  ThemeStore() : super(ThemeMode.dark);

  toggle() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else if (value == ThemeMode.light) {
      value = ThemeMode.dark;
    }
  }
}
