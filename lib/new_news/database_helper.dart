import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'news_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE news(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        url TEXT
      )
    ''');
  }

  Future<void> insertNews(Map<String, dynamic> news) async {
    final db = await database;
    await db.insert('news', news, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getNews() async {
    final db = await database;
    return await db.query('news');
  }

  Future<void> updateNews(int id, Map<String, dynamic> news) async {
    final db = await database;
    await db.update('news', news, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteNews(int id) async {
    final db = await database;
    await db.delete('news', where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getNewsById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query('news', where: 'id = ?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
}
