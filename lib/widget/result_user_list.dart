import 'package:flutter/material.dart';
import 'package:pim/model/splitting_result.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ResultUserList extends StatelessWidget {
  const ResultUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SplittingResult> results = Provider.of<UserProvider>(context).results;

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (ctx, index) => Text(
        results[index].from.name + " " + results[index].to.name,
      ),
    );
  }
}
