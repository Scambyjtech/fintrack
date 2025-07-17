import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'add_transaction.dart';
import 'vendors.dart';
import 'items.dart';
import 'ledger.dart';

void main() {
  runApp(FinTrackApp());
}

class FinTrackApp extends StatefulWidget {
  @override
  _FinTrackAppState createState() => _FinTrackAppState();
}

class _FinTrackAppState extends State<FinTrackApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTrack',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Dashboard(toggleTheme: toggleTheme),
    );
  }
}