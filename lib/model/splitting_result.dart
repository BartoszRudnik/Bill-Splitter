import 'package:pim/model/user.dart';

class SplittingResult {
  User from;
  User to;
  double amount;

  SplittingResult({
    required this.from,
    required this.to,
    required this.amount,
  });
}
