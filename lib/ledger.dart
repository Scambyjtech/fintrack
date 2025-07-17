import 'package:flutter/material.dart';
import 'database_helper.dart';

class LedgerScreen extends StatefulWidget {
  @override
  _LedgerScreenState createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() async {
    final data = await DatabaseHelper().getTransactions();
    setState(() => transactions = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ledger')),
      body: transactions.isEmpty
          ? Center(child: Text('No transactions'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final txn = transactions[index];
                return ListTile(
                  title: Text('${txn['description']}'),
                  subtitle: Text('${txn['type']} | GST: ${txn['gst']}'),
                  trailing: Text('${txn['total']}'),
                );
              },
            ),
    );
  }
}