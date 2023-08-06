import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  bool isCricket = false, isFootball = false, isSinging = false;
  String gender = 'Gender', male = 'Male', feMale = 'Female';
  List<String> stream = ['Arts', 'Commerce', 'Science'];
  String? selectedStream;
  bool isActive = false;
  double selectedSalary = 1000;
  TextEditingController txtFirstNameEditingController = TextEditingController();
  TextEditingController txtSurNameEditingController = TextEditingController();
  TextEditingController txtLastNameEditingController = TextEditingController();

  List<String> hobbyList = [];
  bool isSubmited = false;

  void checkGender(String value) {
    isSubmited = false;
    gender = value;
    notifyListeners();
  }

  void showData() {
    isSubmited = true;
    notifyListeners();
  }

  void cricketMethod(bool value) {
    isSubmited = false;
    isCricket = value;
    isCricket == true ? hobbyList.add('Cricket') : hobbyList.remove('Cricket');
    notifyListeners();
  }

  void footballMethod(bool value) {
    isSubmited = false;
    isFootball = value;
    isFootball == true
        ? hobbyList.add('Football')
        : hobbyList.remove('Football');
    notifyListeners();
  }

  void streamMethod(String value) {
    selectedStream = value;

    notifyListeners();
  }

  void singingMethod(bool value) {
    isSubmited = false;
    isSinging = value;
    isSinging == true ? hobbyList.add('Singing') : hobbyList.remove('Singing');
    notifyListeners();
  }

  void switchMethod(bool value) {
    isSubmited = false;
    isActive = value;

    notifyListeners();
  }

  void sliderMethod(double value) {
    isSubmited = false;
    selectedSalary = value;

    notifyListeners();
  }
}
