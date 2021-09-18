import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passport/db/contact.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController qrdataFeed = TextEditingController();
  Box userData = Hive.box("userdata");

  @override
  Widget build(BuildContext context) {
    Contact contact = userData.get("user");
    String qrData = contact.name + "~" + contact.mobile + "~" + contact.email;
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Center(child: Text("Generate QR Code")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          //Scroll view given to Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QrImage(data: qrData),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}