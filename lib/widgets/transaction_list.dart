// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TranscationList extends StatelessWidget {
  //const TranscationList({super.key});
  final List<Transaction> transactions;

  TranscationList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, itemIndex) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(6),
                child: Text(
                  '\$${transactions[itemIndex].amount?.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[itemIndex].title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium, /* TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ), */
                  ),
                  Text(
                    DateFormat.yMMMMd().format(transactions[itemIndex].date),
                    //'\$${tx.date}',
                    //tx.date.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  )
                ],
              )
            ]),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
