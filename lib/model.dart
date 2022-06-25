import 'package:flutter/cupertino.dart';

class MyModel with ChangeNotifier{
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}