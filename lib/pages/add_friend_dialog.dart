// pages/add_friend_dialog.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AddFriendDialog extends StatelessWidget {
  void _openContacts() async {
    const url = 'content://contacts/people/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not open contacts';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a Friend'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Friend Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('My Contact'),
        ),
        ElevatedButton(
          onPressed: () {
            _openContacts;
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
