import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:passport/widgets/contact.dart';
import '../db/contact.dart';


class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Box<Contact> box = Hive.box<Contact>("contacts");

  void deleteContact(int index) {
    setState(() {
      box.deleteAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              Contact contact = Contact(
                  name: box.getAt(index)!.name,
                  mobile: box.getAt(index)!.mobile,
                  email:  box.getAt(index)!.email,
              );
              return ContactWidget(contact, index, deleteContact);
              },
          )
      );
  }
}