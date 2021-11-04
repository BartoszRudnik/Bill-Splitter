import 'package:pim/model/splitting_result.dart';
import 'package:pim/model/user.dart';

class SplittingAlgorithm {
  static List<SplittingResult> calculate(List<User> initUsers) {
    List<SplittingResult> result = [];
    double sumOfAmounts = 0;
    double averageAmount = 0;
    List<User> users = [];

    for (var user in initUsers) {
      users.add(User(amount: user.amount, id: user.id, name: user.name));
      sumOfAmounts += user.amount;
    }

    averageAmount = sumOfAmounts / users.length;

    users.sort((a, b) => a.amount.compareTo(b.amount));

    int i = 0;
    int j = users.length - 1;

    while (i < j) {
      double userAExpensesDifference = (averageAmount - users[i].amount).abs();
      double userBExpensesDifference = (averageAmount - users[j].amount).abs();

      if (userAExpensesDifference > userBExpensesDifference) {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userBExpensesDifference));
        users[i].amount += userBExpensesDifference;
        j--;
      } else if (userAExpensesDifference == userBExpensesDifference) {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userAExpensesDifference));
        i++;
        j--;
      } else {
        result.add(SplittingResult(from: users[i], to: users[j], amount: userAExpensesDifference));
        users[j].amount -= userAExpensesDifference;
        i++;
      }
    }

    return result;
  }
}
