import 'package:flutter/cupertino.dart';
import 'package:pim/model/user.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [];

  String getNumberOfPerson() {
    return users.length.toString() + " person's";
  }

  String getTotalAmount() {
    double totalAmount = 0;

    for (final user in users) {
      totalAmount += user.amount;
    }

    return "\$ " + totalAmount.toStringAsFixed(2);
  }
}
