// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/ui/user/live/aovivo_page.dart';
import 'package:olimtec_tcc/app/ui/user/home/home_page.dart';
import 'package:olimtec_tcc/app/ui/user/modalities/modalities_page.dart';
import 'package:olimtec_tcc/app/ui/user/settings/settings_page.dart';

/* class BottomBarStore extends StateNotifier {
  int index = 0;
  List<Widget> _pages = [];

BottomBarStore() : super()
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
} */

class BottomBarStore extends StateNotifier<int> {
  BottomBarStore() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
