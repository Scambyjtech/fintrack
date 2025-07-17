import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fintrack.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        amount REAL,
        description TEXT,
        gst REAL,
        total REAL,
        date TEXT
      )
    ''');
  }

  Future<int> insertTransaction(Map<String, dynamic> txn) async {
    final database = await db;
    return await database.insert('transactions', txn);
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final database = await db;
    return await database.query('transactions', orderBy: 'date DESC');
  }
}