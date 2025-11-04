import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  String _iconForCategory(String cat) {
    switch (cat.toLowerCase()) {
      case 'food':
        return 'https://cdn-icons-png.flaticon.com/512/1046/1046784.png';
      case 'travel':
        return 'https://cdn-icons-png.flaticon.com/512/3349/3349237.png';
      case 'shopping':
        return 'https://cdn-icons-png.flaticon.com/512/2331/2331948.png';
      case 'subscription':
        return 'https://cdn-icons-png.flaticon.com/512/3578/3578064.png';
      case 'income':
        return 'https://cdn-icons-png.flaticon.com/512/1170/1170678.png';
      default:
        return 'https://cdn-icons-png.flaticon.com/512/1170/1170678.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.amount.startsWith('-');
    final amountColor = isExpense ? Colors.red : Colors.green;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        backgroundImage: NetworkImage(_iconForCategory(transaction.category)),
      ),
      title: Text(transaction.title,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(transaction.category,
          style: const TextStyle(color: Colors.black54)),
      trailing: Text(
        transaction.amount,
        style: TextStyle(
          color: amountColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
