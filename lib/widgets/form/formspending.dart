import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class FormSpending extends StatefulWidget {
  final List<Transaction> transactions;
  final Function submitFormHandler;

  FormSpending({
    required this.transactions,
    required this.submitFormHandler,
  });

  @override
  _FormSpendingState createState() => _FormSpendingState();
}

class _FormSpendingState extends State<FormSpending> {
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  DateTime? _datePickerVal = null;

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

  void _submitData() {
    String _title = inputTitleController.text;
    double _amount = double.parse(inputAmountController.text);
    widget.submitFormHandler(_title, _amount);
    setState(() {
      inputAmountController.clear();
      inputTitleController.clear();
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
              controller: inputTitleController,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: inputAmountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_datePickerVal == null
                      ? 'No Date Chosen!'
                      : 'Picked Date: ${DateFormat().add_yMd().format(_datePickerVal!).toString()}'),
                ),
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
                onPressed: _submitData,
                child: Text('Add Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
