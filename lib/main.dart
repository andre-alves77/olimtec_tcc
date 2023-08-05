import 'package:flutter/material.dart';
import 'package:olimtec_tcc/components/sport_item.dart';
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
          colorScheme: lightColorScheme,
          fontFamily: 'Lato'),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: 'Lato',
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'MODALIDADES',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        body: Column(
          children: [
            SportItem(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            SportItem(Icons.sports_basketball, 'BASQUETE FEMININO'),
            SportItem(Icons.sports_basketball, 'BASQUETE'),
            SportItem(Icons.sports_basketball, 'BASQUETE'),
          ],
        ),
      ),
    );
  }
}
