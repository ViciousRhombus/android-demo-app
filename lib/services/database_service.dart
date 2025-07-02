import 'package:atlanta_assignment/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        username TEXT,
        email TEXT,
        phone TEXT,
        website TEXT,
        address_street TEXT,
        address_suite TEXT,
        address_city TEXT,
        address_zipcode TEXT,
        geo_lat TEXT,
        geo_lng TEXT,
        company_name TEXT,
        company_catchPhrase TEXT,
        company_bs TEXT
        )
        ''');
      },
    );
  }

  Future<void> insertUsers(List<User> users) async {
    final dbClient = await db;
    for (var user in users) {
      await dbClient.insert(
        'Users',
        user.toDbJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<User>> getUsers({String? query}) async {
    final dbClient = await db;
    final result = await dbClient.query(
      'Users',
      where: query != null ? 'name LIKE ?' : null,
      whereArgs: query != null ? ['%$query%'] : null,
      orderBy: 'name ASC',
    );
    return result.map((json) => User.fromDbJson(json)).toList();
  }
}
