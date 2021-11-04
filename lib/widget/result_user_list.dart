import 'package:flutter/material.dart';
import 'package:pim/model/splitting_result.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/single_result_card.dart';
import 'package:provider/provider.dart';

class ResultUserList extends StatelessWidget {
  const ResultUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SplittingResult> results = Provider.of<UserProvider>(context).results;

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (ctx, index) => results[index].amount > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SingleResultCard(user: results[index].from),
                  Column(
                    children: [
                      const Icon(
                        Icons.forward,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text(
                        "\$ " + results[index].amount.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SingleResultCard(user: results[index].to),
                ],
              )
            : Container());
  }
}
