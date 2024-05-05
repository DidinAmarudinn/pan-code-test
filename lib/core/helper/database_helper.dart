import 'dart:async';
import 'package:pan_code_test/core/data/model/table/post_table.dart';
import 'package:pan_code_test/core/data/model/table/user_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblLike = 'like';
  static const String _tblFriends = 'friend';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/pan_test.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblFriends (
        id TEXT PRIMARY KEY,
        title TEXT,
        firstName TEXT,
        lastName TEXT,
        picture TEXT,
        gender TEXT,
        email TEXT,
        dateOfBirth TEXT,
        phone TEXT,
        locationStreet TEXT,
        locationCity TEXT,
        locationState TEXT,
        locationCountry TEXT,
        locationTimezone TEXT,
        registerDate TEXT,
        updatedDate TEXT
      );
    ''');

    await db.execute('''
    CREATE TABLE $_tblLike (
        id TEXT PRIMARY KEY,
        image TEXT,
        likes INTEGER,
        tags TEXT,
        text TEXT,
        publishDate TEXT,
        ownerId TEXT,
        ownerTitle TEXT,
        ownerFirstName TEXT,
        ownerLastName TEXT,
        ownerPicture TEXT
     );
    ''');
  }

  Future<int> addFriend(UserTable user) async {
    final db = await database;
    return await db!.insert(_tblFriends, user.toMap());
  }

  Future<List<Map<String, dynamic>>> getFriends() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblFriends);
    return results;
  }

  Future<int> removeFriend(UserTable user) async {
    final db = await database;
    return await db!.delete(
      _tblFriends,
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<Map<String, dynamic>?> getFriendsById(String id) async {
    final db = await database;
    final results = await db!.query(
      _tblFriends,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
  Future<int> addLikedPost(PostTable post) async {
    final db = await database;
    return await db!.insert(_tblLike, post.toMap());
  }

  Future<List<Map<String, dynamic>>> getLikedPost() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblLike);
    return results;
  }

  Future<int> removeLikedPost(PostTable post) async {
    final db = await database;
    return await db!.delete(
      _tblLike,
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }

  Future<Map<String, dynamic>?> getLikedPostById(String id) async {
    final db = await database;
    final results = await db!.query(
      _tblLike,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
}
