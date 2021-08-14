import 'dart:math';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/form/formspending.dart';
import './widgets/chart/chart.dart';
import './widgets/transactions/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        // errorColor: Colors.red,
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                  ),
                  button: TextStyle(
                    color: Colors.purple,
                  ),
                )),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () => {},
          child: FormSpending(
            transactions: _transactions,
            submitFormHandler: _submitFormHandler,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  void _submitFormHandler(String title, double amount, DateTime choosenDate) {
    if (title.isEmpty || amount <= 0 || choosenDate == Null) {
      return;
    }
    String unique_id = generateRandomString(15);
    setState(() {
      _transactions.add(
        Transaction(
          id: unique_id,
          title: title,
          amount: amount,
          date: choosenDate,
        ),
      );
    });
    // Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.add_circle_sharp,
          size: 50,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(
            recentTransactions: _transactions,
          ),
          Container(
            child: _transactions.isEmpty
                ? Column(
                    children: <Widget>[
                      Text(
                        'No Transactions added yet!',
                        style: Theme.of(context).textTheme.title,
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
                : Transactions(
                    transactions: _transactions,
                    deleteActionHandler: _deleteTransaction,
                  ),
          )
        ],
      ),
    );
  }
}

getRandomString(int i) {}
