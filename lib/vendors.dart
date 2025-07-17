import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  final List<String> vendors = ['Vendor A', 'Vendor B', 'Vendor C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vendors')),
      body: ListView.builder(
        itemCount: vendors.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(vendors[index]),
        ),
      ),
    );
  }
}