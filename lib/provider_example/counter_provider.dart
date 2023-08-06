import 'dart:developer';

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  void increament() {
    count++;
    log('$count');
    notifyListeners();
  }
}
