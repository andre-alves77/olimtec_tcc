import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/app.dart';
import 'package:olimtec_tcc/app/theme/theme_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeStore(),
        ),
      ],
      child: App(),
    ),
  );
}
