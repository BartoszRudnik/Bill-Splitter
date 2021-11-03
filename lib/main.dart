import 'package:flutter/material.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/screen/first_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Bill Share App',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(71, 41, 123, 1),
          primaryColorDark: const Color.fromRGBO(135, 54, 170, 1),
          primaryColorLight: const Color.fromRGBO(245, 189, 31, 1),
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
