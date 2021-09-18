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
  var uuid = Uuid();
  // String generateRandom() {
  //   S
  // }

  void deleteContact(int index) {
    setState(() {
      print(index);
      Contact? contact = box.getAt(index);
      print(contact!.name);
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
              Contact? contact = box.getAt(index);
              if (contact != null) {
                return ContactWidget(contact, index, deleteContact);
              }
              throw KeyEventResult.ignored;
              },
          )
      );
  }
}