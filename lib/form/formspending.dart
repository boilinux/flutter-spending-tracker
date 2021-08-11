import 'package:flutter/material.dart';

class FormSpending extends StatelessWidget {
  final Function inputTitleHandler;
  final Function inputAmountHandler;
  final VoidCallback submitFormHandler;

  FormSpending({
    required this.inputTitleHandler,
    required this.inputAmountHandler,
    required this.submitFormHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (val) => inputTitleHandler(val),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onChanged: (val) => inputAmountHandler(val),
            ),
            Container(
              child: TextButton(
                onPressed: submitFormHandler,
                child: Text('Add Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
