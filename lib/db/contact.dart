import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact{
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String mobile;


  Contact({required this.name,required this.email,required this.mobile});
}