import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/pages/contact_details.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.mic), onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.more_vert), onPressed: () {}),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    "Contacts",
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_add_rounded),
                backgroundColor: Colors.white,
              ),
              title: Text("Create Contact"),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = Contact.fromJson(allContacts[index]);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFb9132c),
                      child: Text(contact.firstName[0]),
                    ),
                    title: Text("${contact.firstName} ${contact.lastName}"),
                    subtitle: Text(contact.phoneNumber),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactDetails(
                                  contact: contact,
                                )),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(indent: 30),
                itemCount: allContacts.length,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
