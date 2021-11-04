import 'package:flutter/cupertino.dart';
import 'package:pim/model/splitting_result.dart';
import 'package:pim/model/user.dart';
import 'package:pim/utils/splitting_algorithm.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [];
  List<SplittingResult> results = [];

  void reset() {
    users = [];

    notifyListeners();
  }

  void calculate() {
    results = SplittingAlgorithm.calculate(users);

    notifyListeners();
  }

  void editById(int id, String newName, double newAmount) {
    User user = users.firstWhere((user) => user.id == id);

    user.name = newName;
    user.amount = newAmount;

    notifyListeners();
  }

  void deleteUserById(int id) {
    users.removeWhere((user) => user.id == id);

    notifyListeners();
  }

  void addNewUser(String name, double amount) {
    users.add(User(name: name, amount: amount, id: users.length + 1));

    notifyListeners();
  }

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
