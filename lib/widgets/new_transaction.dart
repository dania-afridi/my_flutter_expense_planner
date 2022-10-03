// ignore_for_file: sort_child_properties_last, deprecated_member_use, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  // ignore: use_key_in_widget_constructors
  const NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //const NewTransaction({super.key});
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Title:'),
                  //onChanged: (titleText) => titleInput = titleText,
                  controller: titleController,
                  onSubmitted: ((_) => submitData()),
                ),
                TextField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Amount:'),
                  //onChanged: (value) => amountInput = value,
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: ((_) => submitData()),
                ),
                TextButton(
                  onPressed: submitData
                  /*   print(titleInput);
                          print(amountInput); */
                  //print(titleController.text);
                  //print(amountController.text);
                  ,
                  // ignore: prefer_const_constructors
                  child: Text('Add Transaction'),
                  style: TextButton.styleFrom(
                      primary: Colors.purple,
                      textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                )
              ])),
    );
  }
}
