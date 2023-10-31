import 'package:flutter/material.dart';
import 'package:projek2/models/contact.dart';
import 'package:projek2/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class AddEditContactScreen extends StatefulWidget {
  const AddEditContactScreen({Key? key}) : super(key: key);

  static const String routeName = '/add-edit-contact';

  @override
  State<AddEditContactScreen> createState() => _AddEditContactScreenState();
}

class _AddEditContactScreenState extends State<AddEditContactScreen> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    final existingContact =
        ModalRoute.of(context)!.settings.arguments as Contact?;
    final isEdit = existingContact != null;

    if (isEdit) {
      nameController.text = existingContact.name;
      emailController.text = existingContact.email;
      phoneController.text = existingContact.phone;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Contact' : 'Add Contact'),
        // title: const Text('Ad/Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final email = emailController.text;
                final phone = phoneController.text;
                final newContact = Contact(
                  id: isEdit
                      ? existingContact.id
                      : DateTime.now().millisecondsSinceEpoch,
                  name: name,
                  email: email,
                  phone: phone,
                );

                if (isEdit) {
                  context.read<ContactProvider>().editContact(newContact);
                } else {
                  context.read<ContactProvider>().addContact(newContact);
                }

                final contact = Contact(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: name,
                  email: email,
                  phone: phone,
                );

                // context.read<ContactProvider>().addContact(contact);

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
