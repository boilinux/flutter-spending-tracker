import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/transaction.dart';
import './widgets/form/formspending.dart';
import './widgets/form/toggleswitch.dart';
import './widgets/chart/chart.dart';
import './widgets/transactions/transactions.dart';
import './widgets/displaylist/noresult.dart';
import './widgets/buttons/mainfloatingbutton.dart';

void main() {
  // code orientation for Portrait Only!
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
    final _mediaQuery = MediaQuery.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;
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

    double _mediaQueryMultiplier = !_isLandscape ? 0.3 : 0.7;

    final widgetTransactions = Container(
      height: (_mediaQuery.size.height -
              appbar.preferredSize.height -
              _mediaQuery.padding.top) *
          _mediaQueryMultiplier,
      child: _transactions.isEmpty
          ? NoResult()
          : Transactions(
              transactions: _transactions,
              deleteActionHandler: _deleteTransaction,
            ),
    );

    return Scaffold(
      floatingActionButton: Platform.isIOS
          ? Container()
          : MainFloatingButton(context, _startAddNewTransaction),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_isLandscape)
              ToggleSwitch(
                isChart: _isChart,
                showChart: _showChart,
              ),
            _isChart || !_isLandscape
                ? Container(
                    height: (_mediaQuery.size.height -
                            appbar.preferredSize.height -
                            _mediaQuery.padding.top) *
                        _mediaQueryMultiplier,
                    padding: EdgeInsets.all(4),
                    child: Chart(
                      recentTransactions: _transactions,
                    ),
                  )
                : widgetTransactions,
            if (!_isLandscape) widgetTransactions
          ],
        ),
      ),
    );
  }
}

getRandomString(int i) {}
