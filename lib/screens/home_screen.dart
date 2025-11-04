import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Starbucks Coffee', '-Rp45.000', 'Food'),
      TransactionModel('Bluebird Taxi', '-Rp30.000', 'Travel'),
      TransactionModel('Shopee Order', '-Rp250.000', 'Shopping'),
      TransactionModel('Spotify Premium', '-Rp59.000', 'Subscription'),
      TransactionModel('Salary', '+Rp6.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Finance Mate',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Cards',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(height: 12),

            // Kartu horizontal
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank Neo',
                    cardNumber: '**** 9988',
                    balance: 'Rp13.750.000',
                    color1: Color(0xFF7B61FF),
                    color2: Color(0xFFFF7E5F),
                  ),
                  AtmCard(
                    bankName: 'Bank BCA',
                    cardNumber: '**** 7722',
                    balance: 'Rp6.540.000',
                    color1: Color(0xFF43C6AC),
                    color2: Color(0xFFF8FFAE),
                  ),
                ].map((card) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: card,
                )).toList(),
              ),
            ),

            const SizedBox(height: 18),

            // Menu grid
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                    child: GridMenuItem(
                        iconUrl:
                            'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
                        label: 'Food')),
                SizedBox(width: 12),
                Expanded(
                    child: GridMenuItem(
                        iconUrl:
                            'https://cdn-icons-png.flaticon.com/512/181/181535.png',
                        label: 'Travel')),
                SizedBox(width: 12),
                Expanded(
                    child: GridMenuItem(
                        iconUrl:
                            'https://cdn-icons-png.flaticon.com/512/2331/2331948.png',
                        label: 'Shopping')),
                SizedBox(width: 12),
                Expanded(
                    child: GridMenuItem(
                        iconUrl:
                            'https://cdn-icons-png.flaticon.com/512/3578/3578064.png',
                        label: 'Subs')),
              ],
            ),

            const SizedBox(height: 18),

            const Text('Recent Transactions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Card putih untuk list transaksi
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: ListView.separated(
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const Divider(height: 8),
                  itemBuilder: (context, idx) {
                    return TransactionItem(transaction: transactions[idx]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
