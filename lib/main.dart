import 'package:egitim_flutter_tubitak/screens/rehber_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Text',
        home: RehberScreen());
  }
}
