import 'dart:typed_data';

class User {
  int id;
  String name;
  double amount;
  Uint8List? image;

  User({
    required this.id,
    required this.name,
    required this.amount,
    required this.image,
  });
}
