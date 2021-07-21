import 'package:sqflite/sqflite.dart';

mixin Queries {
  late Database dbInstance;

  Future<void> createCurrenciesTable() async {
    await dbInstance.execute('CREATE TABLE currencies ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name_en TEXT,'
        'name_ar TEXT'
        ')');
  }

  //this for insert currencies because the add currency screen is not created
  Future<void> insertCurrencies() async {
    await dbInstance
        .rawInsert('INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',['NIS','شيكل']);

    await dbInstance
        .rawInsert('INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',['Dollar','دولار']);

    await dbInstance
        .rawInsert('INSERT INTO currencies (name_en, name_ar) VALUES (?, ?)',['JOD','دينار']);
  }

  Future<void> createUsersTable() async {
    await dbInstance.execute('CREATE TABLE users ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        'email TEXT UNIQUE,'
        'currency_id TINYINT,'
        'day_limit REAL,'
        'pin INTEGER'
        ')');
  }

  Future<void> createCategoriesTable() async {
    await dbInstance.execute('CREATE TABLE categories ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        'user_id INTEGER,'
        'expense BOOLEAN'
        ')');
  }

  Future<void> createActionsTable() async {
    await dbInstance.execute('CREATE TABLE actions ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'amount INTEGER,'
        'date TEXT,'
        'expense BOOLEAN,'
        'notes TEXT NULL,'
        'user_id INTEGER,'
        'category_id INTEGER,'
        'currency_id INTEGER'
        ')');
  }
}
