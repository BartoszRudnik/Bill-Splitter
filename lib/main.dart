import 'package:flutter/material.dart';
import 'package:pim/config/routes.dart';
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
          primaryColor: const Color(0xFF344955),
          primaryColorDark: const Color(0xFFe0e2ee),
          primaryColorLight: const Color(0xFFF9AA33),
          accentColor: const Color(0xFF232F34),
        ),
        home: const FirstScreen(),
        routes: Routes.routes,
      ),
    );
  }
}
