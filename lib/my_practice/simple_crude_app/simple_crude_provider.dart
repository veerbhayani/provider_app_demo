import 'package:flutter/material.dart';

class SimpleCrudProvider extends ChangeNotifier {
  bool isCricket = false, isFootball = false, isSinging = false;
  bool isCricketUpdate = false,
      isFootballUpdate = false,
      isSingingUpdate = false;

  String gender = 'gender', male = 'male', feMale = 'feMale';
  String genderUpdate = 'gender', maleUpdate = 'male', feMaleUpdate = 'feMale';

  List<String> stream = ['arts', 'commerce', 'science'];
  List<String> streamUpdate = ['arts', 'commerce', 'science'];

  String? selectedStream;
  String? selectedStreamUpdate;

  bool isActive = false;
  bool isActiveUpdate = false;

  double selectedSalary = 1000;
  double selectedSalaryUpdate = 1000;

  TextEditingController txtFirstNameEditingController = TextEditingController();
  TextEditingController txtMiddleEditingController = TextEditingController();
  TextEditingController txtLastNameEditingController = TextEditingController();
  TextEditingController txtUpdateFirstNameEditingController =
      TextEditingController();
  TextEditingController txtUpdateMiddleEditingController =
      TextEditingController();
  TextEditingController txtUpdateLastNameEditingController =
      TextEditingController();
  List<Map<String, dynamic>> userData = [];
  int selectedIndex = 0;
  List<String> hobbyList = [];

  bool isSubmited = false;

  void checkGender(String value) {
    isSubmited = false;
    gender = value;
    notifyListeners();
  }

  void checkGenderDialog(String value) {
    genderUpdate = value;
    notifyListeners();
  }

  void showData() {
    isSubmited = true;
    notifyListeners();
  }

  void cricketMethod(bool value) {
    isCricket = value;
    notifyListeners();
  }

  void cricketMethodDialog(bool value) {
    isCricketUpdate = value;

    notifyListeners();
  }

  void footballMethod(bool value) {
    isFootball = value;
    notifyListeners();
  }

  void footballMethodDialog(bool value) {
    isFootballUpdate = value;
    notifyListeners();
  }

  void singingMethod(bool value) {
    isSinging = value;
    notifyListeners();
  }

  void singingMethodDialog(bool value) {
    isSingingUpdate = value;
    notifyListeners();
  }

  void streamMethod(String value) {
    selectedStream = value;

    notifyListeners();
  }

  void streamMethodDialog(String value) {
    selectedStreamUpdate = value;

    notifyListeners();
  }

  void switchMethod(bool value) {
    isSubmited = false;
    isActive = value;

    notifyListeners();
  }

  void switchMethodDialog(bool value) {
    isActiveUpdate = value;

    notifyListeners();
  }

  void sliderMethod(double value) {
    isSubmited = false;
    selectedSalary = value;

    notifyListeners();
  }

  void sliderMethodDialog(double value) {
    selectedSalaryUpdate = value;

    notifyListeners();
  }

  void addUserData() {
    hobbyList.clear();
    if (isCricket == true) {
      hobbyList.add('Cricket');
    }
    if (isFootball == true) {
      hobbyList.add('Football');
    }
    if (isSinging == true) {
      hobbyList.add('Singing');
    }
    userData.add({
      'name': txtFirstNameEditingController.text,
      'middle': txtMiddleEditingController.text,
      'lastName': txtLastNameEditingController.text,
      'salary': selectedSalary,
      'gender': gender,
      'hobby': List.from(hobbyList.map((e) => e)),
      'stream': selectedStream,
      'active': isActive,
    });
  }

  void clearMethod() {
    txtFirstNameEditingController.clear();
    txtMiddleEditingController.clear();
    txtLastNameEditingController.clear();
    selectedSalary = 1000;
    gender = 'gender';
    hobbyList.clear();
    isCricket = false;
    isFootball = false;
    isSinging = false;
    isActive = false;
    selectedStream = null;
  }

  void clearUpdateMethod() {
    txtUpdateFirstNameEditingController.clear();
    txtUpdateMiddleEditingController.clear();
    txtLastNameEditingController.clear();
    selectedSalaryUpdate = 1000;
    genderUpdate = 'gender';
    hobbyList.clear();

    isActiveUpdate = false;
    selectedStreamUpdate = null;
  }

  void onTapUpdate() {
    hobbyList.clear();
    txtUpdateFirstNameEditingController.text = userData[selectedIndex]['name'];
    txtUpdateMiddleEditingController.text = userData[selectedIndex]['middle'];
    txtUpdateLastNameEditingController.text =
        userData[selectedIndex]['lastName'];
    selectedSalaryUpdate = userData[selectedIndex]['salary'];
    genderUpdate = userData[selectedIndex]['gender'];
    if (userData[selectedIndex]['hobby'].contains('Cricket')) {
      isCricketUpdate = true;
    }
    if (userData[selectedIndex]['hobby'].contains('Football')) {
      isFootballUpdate = true;
    }
    if (userData[selectedIndex]['hobby'].contains('Singing')) {
      isSingingUpdate = true;
    }
    selectedStreamUpdate = userData[selectedIndex]['stream'];
    isActiveUpdate = userData[selectedIndex]['active'];
    //hobbyList = userData[selectedIndex]['hobby'].map((e) => e).toList();

    notifyListeners();
  }

  void updateMethod() {
    hobbyList.clear();
    if (isCricketUpdate == true) {
      hobbyList.add('Cricket');
    }
    if (isFootballUpdate == true) {
      hobbyList.add('Football');
    }
    if (isSingingUpdate == true) {
      hobbyList.add('Singing');
    }
    userData[selectedIndex]['name'] = txtUpdateFirstNameEditingController.text;
    userData[selectedIndex]['middle'] = txtUpdateMiddleEditingController.text;

    userData[selectedIndex]['lastName'] =
        txtUpdateLastNameEditingController.text;
    userData[selectedIndex]['salary'] = selectedSalaryUpdate;
    userData[selectedIndex]['gender'] = genderUpdate;
    userData[selectedIndex]['hobby'] = List.from(hobbyList.map((e) => e));
    userData[selectedIndex]['stream'] = selectedStreamUpdate;
    userData[selectedIndex]['active'] = isActiveUpdate;
    notifyListeners();
  }

  void updateButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }

  void deleteButton(dynamic context, index) {
    userData.removeAt(index);
    Navigator.pop(context);

    notifyListeners();
  }

  void cancleDeleteButton(dynamic context) {
    Navigator.pop(context);

    notifyListeners();
  }
}
