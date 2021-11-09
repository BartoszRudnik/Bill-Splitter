import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pim/widget/dialog/delete_dialog.dart';
import 'button/edit_user_button.dart';

class SingleUserCard extends StatelessWidget {
  const SingleUserCard({
    Key? key,
    required this.name,
    required this.amount,
    required this.id,
    required this.image,
  }) : super(key: key);

  final int id;
  final String name;
  final double amount;
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image == null
          ? const CircleAvatar(
              backgroundImage: AssetImage("assets/Profile_avatar_placeholder_large.png"),
            )
          : CircleAvatar(
              backgroundImage: MemoryImage(image!),
            ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: EditUserButton(
                    id: id,
                    existingAmount: amount,
                    existingName: name,
                    existingImage: image,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => DeleteDialog(id: id),
                      );
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(
        "\$ " + amount.toStringAsFixed(2),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
