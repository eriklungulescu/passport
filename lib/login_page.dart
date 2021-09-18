import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passport/contact_page.dart';
import 'package:passport/db/contact.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Box userData = Hive.box("userdata");

  void storeUserData() {
    userData.put("loggedin", true);
    if (nameController.text == "" || mobileController.text == "" || emailController.text == "" ) {

    }

    Contact user = new Contact(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text
    );
    userData.put("user", user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(15,20,15,40),
                    child: const Text(
                      'Passport',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aquire",
                          fontSize: 45,
                      ),
                    )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(
                      fontFamily: "LemonMilk"
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: mobileController,
                    style: TextStyle(
                        fontFamily: "LemonMilk"
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(
                        fontFamily: "LemonMilk"
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                      child: Icon(Icons.check_rounded, size: 50),
                      onPressed: () {
                        storeUserData();
                        if (nameController.text == "" || mobileController.text == "" || emailController.text == "" ) {
                          return;
                        }
                        Navigator.pushReplacementNamed(
                          context,
                          "contacts"
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder()
                      ),
                    )
                ),
              ],
            )));
    }
}