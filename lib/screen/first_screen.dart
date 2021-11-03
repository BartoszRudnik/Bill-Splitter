import 'package:flutter/material.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/appbar/first_screen_appbar.dart';
import 'package:pim/widget/user_list.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String numberOfPersons = Provider.of<UserProvider>(context).getNumberOfPerson();
    final String totalAmount = Provider.of<UserProvider>(context).getTotalAmount();

    return Scaffold(
      appBar: FirstScreenAppBar(
        numberOfPersons: numberOfPersons,
        totalAmount: totalAmount,
      ),
      body: UserList(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
