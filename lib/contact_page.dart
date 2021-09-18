import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passport/widgets/contact_list.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
    );
  }
}
