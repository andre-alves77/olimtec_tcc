import 'package:flutter/material.dart';
import 'package:olimtec_tcc/components/sport_item.dart';
import 'package:olimtec_tcc/pages/modalities_page.dart';
import 'theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: lightColorScheme,
          fontFamily: 'Lato'),
      darkTheme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: darkColorScheme,
        fontFamily: 'Lato',
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MODALIDADES',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        body: const ModalitiesPage(),
      ),
    );
  }
}
