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

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: results.length,
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemBuilder: (ctx, index) => results[index].amount > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleResultCard(
                        user: results[index].from,
                        isFirst: true,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.forward,
                            size: 30,
                          ),
                          Text(
                            "\$ " + results[index].amount.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleResultCard(
                        user: results[index].to,
                        isFirst: false,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
