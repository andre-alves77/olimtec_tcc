import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olimtec_tcc/app/features/theme/theme_store.dart';

void main() {
  group('ThemeStore', () {
    test('toggle deve mudar de "Dark" para "Light"', () {
      final themeStore = ThemeStore();

      // O tema inicial é Dark
      expect(themeStore.state, ThemeMode.dark);

      // Função "toggle" para Light
      themeStore.toggle();
      expect(themeStore.state, ThemeMode.light);
    });

    test('toggle deve mudar de "Light" para "Dark"', () {
      final themeStore = ThemeStore();

      // O tema inicial é Light
      themeStore.state = ThemeMode.light;
      expect(themeStore.state, ThemeMode.light);

      // Função "toggle" para Dark
      themeStore.toggle();
      expect(themeStore.state, ThemeMode.dark);
    });

    test('toggle deve alternar entre "Dark" e "Light"', () {
      final themeStore = ThemeStore();

      // O tema inicial é Dark
      expect(themeStore.state, ThemeMode.dark);

      // Função "toggle" para Light
      themeStore.toggle();
      expect(themeStore.state, ThemeMode.light);

      // Função "toggle" de volta para Dark
      themeStore.toggle();
      expect(themeStore.state, ThemeMode.dark);
    });
  });
}
