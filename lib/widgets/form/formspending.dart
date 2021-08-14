import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormSpending extends StatefulWidget {
  final inputTitleController;
  final inputAmountController;
  final VoidCallback submitFormHandler;

  FormSpending({
    required this.inputTitleController,
    required this.inputAmountController,
    required this.submitFormHandler,
  });

  @override
  _FormSpendingState createState() => _FormSpendingState();
}

class _FormSpendingState extends State<FormSpending> {
  var _datePickerVal;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _datePickerVal = value;
      });
    });
  }

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
              controller: widget.inputTitleController,
              onSubmitted: (_) => widget.submitFormHandler(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: widget.inputAmountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => widget.submitFormHandler(),
            ),
            Row(
              children: [
                Text(_datePickerVal == null
                    ? 'No Date Chosen!'
                    : DateFormat().add_yMd().format(_datePickerVal).toString()),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              ],
            ),
            Container(
              child: ElevatedButton(
                onPressed: widget.submitFormHandler,
                child: Text('Add Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
