import 'package:budget_planner/database/db_operations.dart';
import 'package:budget_planner/models/actions.dart';

import '../db_provider.dart';

class ActionDbController extends DbOperations<Operation>{

  ActionDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(Operation data) async{
    return await database.insert(Operation.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(Operation.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Operation>> read() async{
    var rowsMaps = await database.query(Operation.TABLE_NAME);
    return rowsMaps.map((rowMap) => Operation.fromMap(rowMap)).toList();
  }

  @override
  Future<Operation?> show(int id) async{
    var data = await database.query(Operation.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => Operation.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(Operation data) async{
    int countOfUpdatedRows = await database.update(Operation.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }

  Future<void> deleteAllRows() async{
    await database.delete(Operation.TABLE_NAME);
  }

}