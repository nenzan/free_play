import 'package:flutter/material.dart';
import 'package:free_play/app/app_view.dart';

void main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: App());
  }
}