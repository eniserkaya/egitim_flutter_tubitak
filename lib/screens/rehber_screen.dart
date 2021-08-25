import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RehberScreen extends StatefulWidget {
  @override
  _RehberScreenState createState() => _RehberScreenState();
}

class _RehberScreenState extends State<RehberScreen> {
  List _rehberList = [];

  @override
  void initState() {
    izinIste().then((izinVerildiMi) {
      // rehberi getireceğiz.
      if (izinVerildiMi) {
        print('REHBERİ GETİR');
        rehberiGetir().then((rehberListesi) {
          setState(() {
            _rehberList = rehberListesi.toList();
          });
        });
      } else {
        SnackBar snackBar = SnackBar(
          content: Text('İzin vermediğiniz için üzgünüz.'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SMS Uygulamasi')),
        body: _rehberList.length > 0
            ? ListView.builder(
                itemCount: _rehberList.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact kisi = _rehberList.elementAt(index);
                  return ListTile(
                    title: Text(kisi.displayName ?? 'Null geldi'),
                    leading: CircleAvatar(child: Text(kisi.displayName![0]),),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Future<bool> izinIste() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print('Bu izin zaten verilmiş');
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<Iterable<Contact>> rehberiGetir() async {
    // Get all contacts without thumbnail (faster)
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    return contacts;
  }
}
