import 'package:flutter/material.dart';
import 'package:pim/widget/dialog/delete_dialog.dart';
import 'package:pim/widget/dialog/edit_user.dart';

class SingleUserCard extends StatelessWidget {
  const SingleUserCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.id,
  }) : super(key: key);

  final int id;
  final String name;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          elevation: 2,
          color: Theme.of(context).accentColor,
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "\$ " + amount.toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        EditUser.showEditForm(context, name, amount, id);
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => DeleteDialog(id: id),
                        );
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
