import 'package:budget_planner/database/db_operations.dart';
import 'package:budget_planner/models/actions.dart';

import '../db_provider.dart';

class ActionDbController extends DbOperations<Action>{

  ActionDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(Action data) async{
    return await database.insert(Action.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(Action.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Action>> read() async{
    var rowsMaps = await database.query(Action.TABLE_NAME);
    return rowsMaps.map((rowMap) => Action.fromMap(rowMap)).toList();
  }

  @override
  Future<Action?> show(int id) async{
    var data = await database.query(Action.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => Action.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(Action data) async{
    int countOfUpdatedRows = await database.update(Action.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }


}