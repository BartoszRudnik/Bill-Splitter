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
    final String numberOfPersons = Provider.of<UserProvider>(context).getNumberOfPerson();
    final String totalAmount = Provider.of<UserProvider>(context).getTotalAmount();

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Split Bill",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    totalAmount,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    numberOfPersons,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
