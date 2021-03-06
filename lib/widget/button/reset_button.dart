import 'package:flutter/material.dart';
import 'package:pim/config/button_themes.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2, vertical: 8),
      color: Theme.of(context).primaryColorDark,
      child: ElevatedButton(
        style: ButtonThemes.submitButtonStyle(context),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Reset',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).reset();

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
