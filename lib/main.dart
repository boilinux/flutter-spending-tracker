import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/transaction.dart';
import './widgets/form/formspending.dart';
import './widgets/form/toggleswitch.dart';
import './widgets/chart/chart.dart';
import './widgets/transactions/transactions.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
  bool _isChart = false;
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

  void _showChart(bool val) {
    setState(() {
      _isChart = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
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
    );

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
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ToggleSwitch(
            isChart: _isChart,
            showChart: _showChart,
          ),
          _isChart
              ? Container(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.6,
                  padding: EdgeInsets.all(4),
                  child: Chart(
                    recentTransactions: _transactions,
                  ),
                )
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
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
                              height: cons.maxHeight * 0.6,
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
