import 'package:flutter/material.dart';
import 'package:pim/widget/dialog/add_new_user.dart';

class AddNewUserButton extends StatelessWidget {
  const AddNewUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AddNewUser.showAddUserForm(context);
      },
      backgroundColor: Theme.of(context).primaryColorLight,
      child: const Icon(
        Icons.add_outlined,
        size: 48,
        color: Colors.white,
      ),
    );
  }
}
