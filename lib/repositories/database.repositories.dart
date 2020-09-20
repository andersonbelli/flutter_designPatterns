import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//import 'package:uuid/uuid.dart';
//var uuid = Uuid();

class DatabaseConfiguration {
  static const String _tableName = 'register';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _iconOption = 'iconOption';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id TEXT PRIMARY KEY, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_iconOption INTEGER)';

  static Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'flutterSql.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute(tableSql);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }
}
