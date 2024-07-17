import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense/model/transaction.dart';
import 'package:personal_expense/widget/chart.dart';
import 'package:personal_expense/widget/transaction_list.dart';

import 'widget/new_transaction.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> with WidgetsBindingObserver {
  List<Transaction> transactions = List<Transaction>();

  bool _showChart = false;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

  List<Transaction> get _recentTrn {
    return transactions.where((tx) {
      return tx.spendTime.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      spendTime: date,
      id: DateTime.now().toString(),
    );
    // Navigator.pop(context);
    setState(() {
      transactions.add(newTx);
    });
  }

  void _deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  void showAddTranModel() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(
            onSubmitForm: _addNewTransaction,
          );
        });
  }

  List<Widget> _landscapeView(AppBar appBar, Widget txList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Show chart'),
          Switch(
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: ChartWidget(
                recentTransactions: _recentTrn,
              ),
            )
          : txList,
    ];
  }

  List<Widget> _portraitView(AppBar appBar, Widget txList) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.23,
        child: ChartWidget(
          recentTransactions: _recentTrn,
        ),
      ),
      txList
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Personal expensese'),
    );
    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBar.preferredSize.height) *
          0.77,
      child: TransactionList(
        transactions: transactions,
        onDeletePress: _deleteTransaction,
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: Text('Home'),
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      showAddTranModel();
                    },
                  ),
            body: Container(
              child: Column(
                children: [
                  if (isLandscape) ..._landscapeView(appBar, txList),
                  if (!isLandscape) ..._portraitView(appBar, txList),
                ],
              ),
            ),
          );
  }
}
