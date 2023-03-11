
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future login() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}

final loginNotifierProvider = ChangeNotifierProvider((ref) => LoginNotifier());
