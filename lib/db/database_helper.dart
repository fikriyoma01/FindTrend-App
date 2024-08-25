import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE users ( 
  id $idType, 
  email $textType,
  password $textType
  )
''');
  }

  Future<void> insertUser(User user) async {
    final db = await instance.database;
    await db.insert('users', user.toMap());
  }

  Future<List<User>> getUsers() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<User?> getUserByEmail(String email) async {
  final db = await instance.database;
  final maps = await db.query(
    'users',
    columns: ['id', 'email', 'password'],
    where: 'email = ?',
    whereArgs: [email],
  );

  if (maps.isNotEmpty) {
    return User.fromMap(maps.first);
  } else {
    return null;
  }
}


  Future<void> close() async {
    final db = await instance.database;

    db.close();
  }
}
