import 'package:flutter/material.dart';
import 'package:pim/model/user.dart';

class SingleResultCard extends StatelessWidget {
  const SingleResultCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        color: Theme.of(context).accentColor,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
