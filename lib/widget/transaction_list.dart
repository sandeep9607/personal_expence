import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/model/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key key,
    @required this.transactions,
    this.onDeletePress,
  }) : super(key: key);

  final List<Transaction> transactions;
  final Function onDeletePress;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/waiting.png',
                  width: 70,
                ),
                SizedBox(height: 10),
                Text('No transaction yet!',
                    style: Theme.of(context).textTheme.bodyText1)
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      transactions[index].amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    DateFormat()
                        .add_yMMMd()
                        .format(transactions[index].spendTime),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 350
                      ? FlatButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => onDeletePress(index),
                          label: Text('Delete'),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => onDeletePress(index)),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
