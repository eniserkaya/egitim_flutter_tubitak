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
      body: Center(
        child: Column(
          children: [
            myTextWidget(),
            myImageWidget()
          ],
        ),
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
          onPressed: _butonaBasildi, child: Icon(Icons.ac_unit)),
    );
  }

  void _butonaBasildi() {
    print('Bastin');
  }

  myTextWidget() {
    return Text('TextWidget Ornek',
    style: TextStyle(
      fontSize:20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
      fontFamily: 'Lacquer'
    ),);
  }

  myImageWidget(){
    return Image.asset("assets/images/indir.png");
  }

  myNetworkImageWidget(){
    return Image(
      image: NetworkImage('htt')
    );
  }
}
