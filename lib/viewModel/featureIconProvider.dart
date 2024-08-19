import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  int _screenIndex = 0;
  List<Color> _containerColors = List<Color>.filled(5, Colors.white);

  int get screenIndex => _screenIndex;
  List<Color> get containerColors => _containerColors;
  void resetContainerColors() {
    _containerColors = List<Color>.filled(5, Colors.white);
    notifyListeners();
  }

  void updateContainerColor(int index) {
    _containerColors[index] =
        _containerColors[index] == Colors.white ? Colors.blue : Colors.white;
    _screenIndex = index + 1;
    notifyListeners();
  }
}
