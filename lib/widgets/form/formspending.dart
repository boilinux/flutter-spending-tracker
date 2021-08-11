import 'package:flutter/material.dart';

class FormSpending extends StatelessWidget {
  final inputTitleController;
  final inputAmountController;
  final VoidCallback submitFormHandler;

  FormSpending({
    required this.inputTitleController,
    required this.inputAmountController,
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
              controller: inputTitleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: inputAmountController,
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
