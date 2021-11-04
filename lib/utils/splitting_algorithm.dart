import 'package:pim/model/splitting_result.dart';
import 'package:pim/model/user.dart';

class SplittingAlgorithm {
  static List<SplittingResult> calculate(List<User> users) {
    List<SplittingResult> result = [];
    double sumOfAmounts = 0;
    double averageAmount = 0;

    for (var user in users) {
      sumOfAmounts += user.amount;
    }

    averageAmount = sumOfAmounts / users.length;

    users.sort((a, b) => a.amount.compareTo(b.amount));
    users = users.reversed.toList();

    int i = 0;
    int j = users.length - 1;

    while (i < j) {
      double userAExpensesDifference = averageAmount - users[i].amount;
      double userBExpensesDifference = averageAmount - users[j].amount;

      if (userAExpensesDifference.abs() > userBExpensesDifference.abs()) {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userAExpensesDifference.abs() - userBExpensesDifference.abs()));
        users[i].amount += userBExpensesDifference.abs();
        j--;
      } else if (userAExpensesDifference.abs() == userBExpensesDifference.abs()) {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userAExpensesDifference));
        i++;
        j--;
      } else {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userAExpensesDifference));
        i++;
      }
    }

    return result;
  }
}
