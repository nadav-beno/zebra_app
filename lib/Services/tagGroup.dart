import 'package:zebra_app/Services/contact.dart';

class tagGroups{
  String groupName;
  List<contact> contacts;

  tagGroups({required this.groupName, required this.contacts});

  void addContact(contact){
      this.contacts.add(contact);
  }
}