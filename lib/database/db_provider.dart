import 'dart:io';

import 'package:budget_planner/database/queries.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider with Queries{
  static final DBProvider _instance = DBProvider._internal();
  late final Database _database;

  factory DBProvider() {
    return _instance;
  }

  DBProvider._internal();

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_database.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        dbInstance = db;
        await createCurrenciesTable();
        await insertCurrencies();
        await createUsersTable();
        await createCategoriesTable();
        await createActionsTable();
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }

}
