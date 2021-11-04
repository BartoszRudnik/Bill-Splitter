import 'package:flutter/material.dart';
import 'package:pim/widget/appbar/second_screen_appbar.dart';
import 'package:pim/widget/result_user_list.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondScreenAppBar(),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: const ResultUserList(),
    );
  }
}
