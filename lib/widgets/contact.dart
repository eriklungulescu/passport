import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passport/db/contact.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget(this.contact, this.id, this.deleteContact);

  Contact contact;
  int id;
  Function(int) deleteContact;

  @override
  Widget build(BuildContext context) {
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