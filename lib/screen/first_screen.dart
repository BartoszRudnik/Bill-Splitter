import 'package:flutter/material.dart';
import 'package:pim/widget/appbar/first_screen_appbar.dart';
import 'package:pim/widget/button/calculate_button.dart';
import 'package:pim/widget/user_list.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: const FirstScreenAppBar(),
      body: const UserList(),      
      bottomNavigationBar: const CalculateButton(),
    );
  }
}
