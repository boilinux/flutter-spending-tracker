import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/form/formspending.dart';
import './widgets/chart/chart.dart';
import './widgets/displaylist/dateDisplay.dart';
import './widgets/displaylist/priceDisplay.dart';
import './widgets/displaylist/titleDisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 55.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New shirt',
      amount: 44.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Jeans',
      amount: 15.99,
      date: DateTime.now(),
    ),
  ];

  void _submitFormSpending() {
    double amount = double.parse(amountController.text);
    if (titleController.text.isEmpty || amount <= 0) {
      return;
    }
    setState(() {
      _transactions.add(
        Transaction(
          id: 't4',
          title: titleController.text,
          amount: amount,
          date: DateTime.now(),
        ),
      );
      amountController.clear();
      titleController.clear();
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () => {},
          child: FormSpending(
            inputTitleController: titleController,
            inputAmountController: amountController,
            submitFormHandler: _submitFormSpending,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.add_circle_sharp,
          size: 50,
        ),
        color: Colors.blue,
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Chart(),
            Container(
              height: 800,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (e, index) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        PriceDisplay(
                          amount:
                              _transactions[index].amount.toStringAsFixed(2),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TitleDisplay(title: _transactions[index].title),
                            DateDisplay(date: _transactions[index].date),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _transactions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
