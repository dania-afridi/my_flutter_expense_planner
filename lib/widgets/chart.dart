// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //const Chart({super.key});

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get weeklyTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount!;
        }
      }

      print(DateFormat.E().format(weekDay));

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalAmount
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(weeklyTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: weeklyTransactionValues.map((data) {
          return Text('${data['day']} : ${data['amount']}  ');
        }).toList(),
      ),
    );
  }
}
