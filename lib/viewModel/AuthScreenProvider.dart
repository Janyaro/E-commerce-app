import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _visible = false;
  bool get Visible => _visible;

  void toggleVisibility() {
    _visible = !_visible;
    notifyListeners();
  }
}
