import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passport/QR/scan_qr.dart';
import 'package:passport/widgets/contact_list.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';

import 'QR/generate_qr.dart';
import 'db/contact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  Box<Contact> contacts = Hive.box("contacts");

  void addContact() async {
    String codeScanner = await BarcodeScanner.scan();    //barcode scanner
    List<String> contactInfo = codeScanner.split("~");
    Contact newContact = Contact(
        name: contactInfo.elementAt(0),
        mobile: contactInfo.elementAt(1),
        email: contactInfo.elementAt(2),
        linkedin: contactInfo.elementAt(3),
        facebook: contactInfo.elementAt(3),
    );
    contacts.add(newContact);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Contacts",
                style: TextStyle(
                  fontFamily: "Aquire",
                    fontSize: 40,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                child: Icon(Icons.person, size: 40,),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      "login"
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: CircleBorder()
                ),
              )
            ],
          )
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContactList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "generate"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: "scan"
          )
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (Context) => GenerateQR())
            );
          } else {
            addContact();
          }
        },
      ),
    );
  }
}
