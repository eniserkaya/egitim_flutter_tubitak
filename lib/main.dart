import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Text', home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merhaba Flutter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Eğitime Hoşgeldiniz.',
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          ElevatedButton(
            onPressed: _butonaBasildi,
            child: Text('Button 1'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black, onPrimary: Colors.red),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text('Current'),
                  backgroundColor: Colors.yellow,
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('AE'),
                  )
                ],
                accountName: Text('Ahmed Enis'),
                accountEmail: Text('aeniserkaya@gmail.com'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _butonaBasildi,
        child: Text('+'),
      ),
    );
  }

  void _butonaBasildi() {
    print('Bastin');
  }
}
