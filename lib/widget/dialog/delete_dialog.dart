import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pim/config/button_themes.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Center(
        child: Text(
          'Are you sure you want to delete this person?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonThemes.submitButtonStyle(context),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ButtonThemes.submitButtonStyle(context),
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).deleteUserById(id);
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
