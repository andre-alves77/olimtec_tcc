// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/pages/aovivo_page.dart';
import 'package:olimtec_tcc/app/pages/home_page.dart';
import 'package:olimtec_tcc/app/pages/modalities_page.dart';
import 'package:olimtec_tcc/app/pages/settings_page.dart';

class BottomBarStore extends ChangeNotifier {
  int index = 0;
  List<Widget> _pages = [];

  set pages(_) {
    pages = const [
      HomePage(),
      ModalitiesPage(),
      MainAoVivo(),
      SettingsPage(),
    ];
  }

  List<Widget> get pages {
    notifyListeners();
    return _pages;
  }

  setIndex(int newIndex) {
    index = newIndex;
    print(index);
    notifyListeners();
  }
}
