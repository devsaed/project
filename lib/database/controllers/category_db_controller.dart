import 'package:budget_planner/database/db_operations.dart';
import 'package:budget_planner/models/category.dart';
import '../db_provider.dart';

class CategoryDbController extends DbOperations<Category>{

  CategoryDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(Category data) async{
    return await database.insert(Category.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(Category.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Category>> read() async{
    var rowsMaps = await database.query(Category.TABLE_NAME);
    return rowsMaps.map((rowMap) => Category.fromMap(rowMap)).toList();
  }

  @override
  Future<Category?> show(int id) async{
    var data = await database.query(Category.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => Category.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(Category data) async{
    int countOfUpdatedRows = await database.update(Category.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }

  Future<void> deleteAllRows() async{
    await database.delete(Category.TABLE_NAME);
  }

}