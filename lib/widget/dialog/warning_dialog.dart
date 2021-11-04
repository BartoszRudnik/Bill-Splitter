import 'package:flutter/material.dart';
import 'package:pim/config/button_themes.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Center(
        child: Text(
          'Add at least 2 person\'s',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonThemes.submitButtonStyle(context),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
