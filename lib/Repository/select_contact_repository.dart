import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/user_model.dart';
import '../Screens/chat_screen.dart';
import '../Utils/utils.dart';

final selectContactsRepositoryProvider = Provider(
      (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(
          ' ',
          '',
        );
        if (selectedPhoneNum == userData.phoneNumber) {
          isFound = true;
          if (!context.mounted) return;
          Navigator.pushNamed(
            context,
            ChatScreen.routeName,
            arguments: {
              'name': userData.name,
              'uid': userData.uid,
              'profilePic': userData.profilePic,
              'isGroupChat': false,
            },
          );
        }
      }

      if (!isFound) {
        if (!context.mounted) return;
        showSnackBar(
          context: context,
          content: 'This number does not exist on this app.',
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }
}
