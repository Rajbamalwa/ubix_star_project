import 'package:flutter/cupertino.dart';

class updateScreenProvider with ChangeNotifier {
  bool textCheck = false;
  bool imageCheck = false;
  bool buttonCheck = false;

  updateText() {
    textCheck = !textCheck;
    notifyListeners();
  }

  updateImage() {
    imageCheck = !imageCheck;

    notifyListeners();
  }

  updateButton() {
    buttonCheck = !buttonCheck;

    notifyListeners();
  }
}
