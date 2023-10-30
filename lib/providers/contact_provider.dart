import 'package:flutter/material.dart';
import 'package:projek2/models/contact.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(Contact contact) {
    final index = _contacts.indexWhere((element) => element.id == contact.id);
    _contacts[index] = contact;
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void clearContacts() {
    _contacts.clear();
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyApp(),
    ),
  );
}

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(Contact contact) {
    final index = _contacts.indexWhere((element) => element.id == contact.id);
    _contacts[index] = contact;
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void clearContacts() {
    _contacts.clear();
    notifyListeners();
  }
}
