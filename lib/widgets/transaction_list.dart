import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No Transactions added yet!',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (cxt, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text('₹ ${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
