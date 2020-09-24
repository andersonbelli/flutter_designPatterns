import 'dart:async';
import 'package:designpatterns/models/user.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

//var uuid = Uuid();

class DatabaseConfiguration {
  static const String _tableName = 'register';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _password = 'password';
  static const String _iconOption = 'iconOption';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id TEXT PRIMARY KEY, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_password TEXT, '
      '$_iconOption TEXT)';

  static Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'flutterSql.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute(tableSql);
    }, version: 2, onDowngrade: onDatabaseDowngradeDelete);
  }

  Future<int> save(UserModel user) async {
    final Database db = await getDatabase();

    Map<String, dynamic> userMap = user.toJson();

    return db.insert(_tableName, userMap);
  }

  Future<List<UserModel>> findAll() async {
    final Database db = await getDatabase();

    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((dynamic json) => UserModel.fromJson(json)).toList();
  }
}
