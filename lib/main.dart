import 'package:flutter/material.dart';
import 'package:olimtec_tcc/components/sport_item.dart';
import 'color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(child: SportItem(Icons.sports_basketball, 'BASQUETE')),
      ),
    );
  }
}
