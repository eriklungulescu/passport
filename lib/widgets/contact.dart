import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passport/db/contact.dart';

class ContactWidget extends StatefulWidget {
  ContactWidget(this.contact, this.id, this.deleteContact);

  Contact contact;
  int id;
  Function(int) deleteContact;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactWidgetState(contact, id, deleteContact);
  }
}

class _ContactWidgetState extends State<ContactWidget> {
  _ContactWidgetState(this.contact, this.id, this.deleteContact);
  Contact contact;
  int id;
  Function(int) deleteContact;

  bool isMaximized = false;
  IconData maximized = Icons.add;

  List<Widget> data = [];

  initializeData() {
    data = [
      Text(contact.name,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ];
  }

  void test() {
    setState(() {
      if (isMaximized) {
        maximized = Icons.add;
        isMaximized = false;
      } else {
        maximized = Icons.minimize;
        isMaximized = true;
      }
    });
  }

  void onExpand() {
    setState(() {
      if (isMaximized) {
        data = [
          Text(contact.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(contact.email,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(contact.mobile,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ];
        isMaximized = false;
        maximized = Icons.minimize;
      } else {
        isMaximized = true;
        maximized = Icons.add;
        data = [
          Text(contact.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ];
      }
      print(data.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeData();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: Colors.black,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(contact.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
            IconButton(
              onPressed: () {
                print("IDNUM");
                print(id);
                deleteContact(id);
                },
            icon: Icon(Icons.close, color: Colors.red),
            highlightColor: Colors.redAccent,
            )
          ],
        ),
        children: [
          RichText(
            textAlign: TextAlign.center,

            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.phone_rounded),
                ),
                TextSpan(
                  text: "  " + contact.mobile,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )

                ),
              ],
            )
          ),RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Icon(Icons.email_rounded)
                  ),
                  TextSpan(
                    text: "  " + contact.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}