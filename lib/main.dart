import 'package:flutter/material.dart';
import 'package:passport/contact_page.dart';
import 'package:passport/login_page.dart';
import 'package:passport/widgets/contact_list.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passport/QR/qr_code.dart';
import 'db/contact.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>("Contacts");
  await Hive.openBox("userdata");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget startUp() {
    Box userData = Hive.box("userdata");
    // Contact user = userData.get("user");
    if (userData.get("user") != Null) {
      return ContactPage();
    } else {
      return LoginPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passport',
      home: startUp(),
      theme: ThemeData(
        fontFamily: "Roboto"
      ),
      routes: {
        "login" : (_) => LoginPage(),
        "contacts" : (_) => ContactPage(),
      },
    );
  }
}

