import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _visible = false;
  bool get visible => _visible;

  bool _isloading = false;
  bool get isloading => _isloading;

  void setloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void toggleVisibility() {
    _visible = !_visible;
    notifyListeners();
  }
}
