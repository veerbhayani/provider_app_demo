import 'package:flutter/material.dart';

class IncreamentDecreament extends ChangeNotifier {
  int count1 = 0;
  int count2 = 0;
  void increamentByOne() {
    count1++;
    notifyListeners();
  }

  void decreamentByOne() {
    count1--;
    notifyListeners();
  }

  void increamentByTwo() {
    count2 += 2;
    notifyListeners();
  }

  void decreamentByTwo() {
    count2 -= 2;
    notifyListeners();
  }
}
