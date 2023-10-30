import 'package:flutter/material.dart';
import 'package:projek2/providers/contact_provider.dart';
import 'package:projek2/screens/add_edit_contact_screen.dart';
// ...
//import 'package:projek2/screens/add_edit_contact_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<ContactProvider>().clearContacts();
            },
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) {
          if (provider.contacts.isEmpty) {
            return const Center(
              child: Text('No Contacts'),
            );
          }

          return ListView.builder(
            itemCount: provider.contacts.length,
            itemBuilder: (context, index) {
              final contact = provider.contacts[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEditContactScreen(),
                      settings: RouteSettings(arguments: contact),
                    ),
                  );
                },
                title: Text(contact.name),
                subtitle: Text(contact.email),
                leading: CircleAvatar(
                  child: Text(contact.name[0].toUpperCase()),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    provider.removeContact(contact);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditContactScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
