// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final bottomBarProvider =
    StateNotifierProvider<BottomBarStore, int>((ref) => BottomBarStore());

class BottomBarStore extends StateNotifier<int> {
  BottomBarStore() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
