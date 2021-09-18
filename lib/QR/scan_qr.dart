import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passport/db/contact.dart';
class ScanQR {
  Box<Contact> contacts = Hive.box("contacts");

  void addContact() async {
    String codeScanner = await BarcodeScanner.scan();    //barcode scanner
    List<String> contactInfo = codeScanner.split("~");
    Contact newContact = Contact(
        name: contactInfo.elementAt(0),
        mobile: contactInfo.elementAt(1),
        email: contactInfo.elementAt(2)
    );
    contacts.add(newContact);
  }

}
