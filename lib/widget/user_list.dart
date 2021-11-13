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
    final String totalAmount = Provider.of<UserProvider>(context).getTotalAmount();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total amount: " + totalAmount,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
              itemBuilder: (ctx, index) => SingleUserCard(
                id: users[index].id,
                name: users[index].name,
                amount: users[index].amount,
                image: users[index].image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
