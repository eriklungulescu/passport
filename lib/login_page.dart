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
      mobile: mobileController.text,
      email: emailController.text

    );
    userData.put("user", user);
  }

  @override
  Widget build(BuildContext context) {
    Contact contact = userData.get("user");
    String name_place;
    if (contact.name == null){
      name_place = 'Name';
    } else {
      name_place = contact.name;
      nameController.text = contact.name;
    }
    String mobile_place;
    if (contact.mobile == null){
      mobile_place = 'Phone Number';
    } else {
      mobile_place = contact.mobile;
      mobileController.text = contact.mobile;
    }
    String email_place;
    if (contact.email == null){
      email_place = 'Email';
    } else {
      email_place = contact.name;
      emailController.text = contact.email;
    }

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
                      //if
                      labelText: name_place,
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
                      labelText: mobile_place,
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
                      labelText: email_place,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Icon(Icons.close, size: 50),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context,
                                "contacts"
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: EdgeInsets.all(10),
                              shape: CircleBorder()
                          ),
                        ),
                        ElevatedButton(
                          child: Icon(Icons.check_rounded, size: 50),
                          onPressed: () {
                            storeUserData();
                            if (nameController.text == "" || mobileController.text == "" || emailController.text == "" ) {
                              print("triggered");
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
                      ],
                    )
                ),
              ],
            )));
    }
}