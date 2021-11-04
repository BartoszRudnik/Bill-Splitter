import 'package:flutter/material.dart';

class ButtonThemes {
  static ButtonStyle submitButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      primary: Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(
          color: Theme.of(context).primaryColorLight,
          width: 1.0,
        ),
      ),
    );
  }
}
