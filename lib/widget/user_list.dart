import 'package:flutter/material.dart';
import 'package:pim/model/user.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/single_user_card.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<User> users = Provider.of<UserProvider>(context).users;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (ctx, index) => SingleUserCard(
        id: users[index].id,
        name: users[index].name,
        amount: users[index].amount,
      ),
    );
  }
}
