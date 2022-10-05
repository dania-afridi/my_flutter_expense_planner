// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TranscationList extends StatelessWidget {
  //const TranscationList({super.key});
  final List<Transaction> transactions;
  final Function deleteTx;

  TranscationList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, itemIndex) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transactions[itemIndex].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[itemIndex].title as String,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactions[itemIndex].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[itemIndex].id),
                    ),
                  ),
                ); /* Card(
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
                          DateFormat.yMMMMd()
                              .format(transactions[itemIndex].date),
                          //'\$${tx.date}',
                          //tx.date.toString(),
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        )
                      ],
                    )
                  ]),
                ); */
              },
              itemCount: transactions.length,
            ),
    );
  }
}
