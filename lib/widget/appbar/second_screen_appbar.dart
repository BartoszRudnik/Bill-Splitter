import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const SecondScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: MediaQuery.of(context).size.width * 0.21,
      title: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Results",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      toolbarHeight: 75,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
