import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FirstScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const FirstScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Split Bill",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      toolbarHeight: 75,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: Theme.of(context).iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
