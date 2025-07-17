import 'package:flutter/material.dart';
import 'add_transaction.dart';
import 'vendors.dart';
import 'items.dart';
import 'ledger.dart';

class Dashboard extends StatelessWidget {
  final VoidCallback toggleTheme;
  Dashboard({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FinTrack Dashboard'), actions: [
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: toggleTheme,
        ),
      ]),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        children: [
          _buildTile(context, 'Add Transaction', Icons.add, AddTransactionScreen()),
          _buildTile(context, 'Vendors', Icons.people, VendorsScreen()),
          _buildTile(context, 'Items', Icons.inventory, ItemsScreen()),
          _buildTile(context, 'Ledger', Icons.list, LedgerScreen()),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 16)),
        ]),
      ),
    );
  }
}