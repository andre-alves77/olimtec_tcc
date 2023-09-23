import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* class ThemeStore extends ValueNotifier<ThemeMode> {
  ThemeStore() : super(ThemeMode.dark);

  toggle() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else if (value == ThemeMode.light) {
      value = ThemeMode.dark;
    }
  }
} */

class ThemeStore extends StateNotifier<ThemeMode> {
  ThemeStore() : super(ThemeMode.dark);

  toggle() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    }
  }
}
