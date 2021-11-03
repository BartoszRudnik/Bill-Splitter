import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const FirstScreenAppBar({
    Key? key,
    required this.numberOfPersons,
    required this.totalAmount,
  }) : super(key: key);

  final String numberOfPersons;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text("Split Bill"),
          Column(
            children: [
              Text(totalAmount),
              Text(numberOfPersons),
            ],
          ),
        ],
      ),
      toolbarHeight: 50,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
