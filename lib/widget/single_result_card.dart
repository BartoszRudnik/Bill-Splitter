import 'package:flutter/material.dart';
import 'package:pim/model/user.dart';

class SingleResultCard extends StatelessWidget {
  const SingleResultCard({
    Key? key,
    required this.user,
    required this.isFirst,
  }) : super(key: key);

  final User user;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      horizontalTitleGap: 8,
      leading: isFirst
          ? user.image == null
              ? const CircleAvatar(
                  backgroundImage: AssetImage("assets/Profile_avatar_placeholder_large.png"),
                )
              : CircleAvatar(
                  backgroundImage: MemoryImage(user.image!),
                )
          : Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
      title: isFirst
          ? Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          : user.image == null
              ? const CircleAvatar(
                  backgroundImage: AssetImage("assets/Profile_avatar_placeholder_large.png"),
                )
              : CircleAvatar(
                  backgroundImage: MemoryImage(user.image!),
                ),
    );
  }
}
