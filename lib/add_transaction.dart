import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _descController = TextEditingController();
  double gst = 0.0;
  String type = 'Income';

  void _saveTransaction() async {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    double total = amount + gst;
    TransactionModel txn = TransactionModel(
      type: type,
      amount: amount,
      description: _descController.text,
      gst: gst,
      total: total,
      date: DateTime.now().toIso8601String(),
    );
    await DatabaseHelper().insertTransaction(txn.toMap());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Transaction Added')));
    _amountController.clear();
    _descController.clear();
    setState(() => gst = 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Transaction')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          DropdownButton<String>(
            value: type,
            items: ['Income', 'Expense'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (val) => setState(() => type = val!),
          ),
          TextField(controller: _amountController, decoration: InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
          TextField(controller: _descController, decoration: InputDecoration(labelText: 'Description')),
          Slider(
            value: gst,
            onChanged: (val) => setState(() => gst = val),
            divisions: 10,
            max: 100,
            label: 'GST: $gst',
          ),
          ElevatedButton(onPressed: _saveTransaction, child: Text('Save')),
        ]),
      ),
    );
  }
}