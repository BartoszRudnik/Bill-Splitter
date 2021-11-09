import 'package:flutter/material.dart';
import 'package:pim/config/button_themes.dart';

class SaveUserButton extends StatelessWidget {
  const SaveUserButton({
    Key? key,
    required this.save,
    required this.ctx,
  }) : super(key: key);

  final Function save;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonThemes.submitButtonStyle(context),
      onPressed: () {
        save(ctx);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
