import 'package:pim/screen/first_screen.dart';
import 'package:pim/screen/second_screen.dart';

class Routes {
  static String firstScreenRoute = "/firstScreen";
  static String secondScreenRoute = "/secondScreen";

  static final routes = {
    firstScreenRoute: (ctx) => const FirstScreen(),
    secondScreenRoute: (ctx) => const SecondScreen(),
  };
}
