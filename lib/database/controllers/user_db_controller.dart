import 'package:budget_planner/database/db_operations.dart';
import 'package:budget_planner/models/user.dart';

import '../db_provider.dart';

class UserDbController extends DbOperations<User>{

  UserDbController(){
    database = DBProvider().database;
  }

  Future<User?> login({required String email, required String pin}) async {
    List<Map<String, dynamic>> data = await database.query('users',
        where: 'email = ? AND pin = ?', whereArgs: [email, pin]);
    if(data.isNotEmpty){
      return data.map((rowMap) => User.fromMap(rowMap)).first;
    }
    return null;
  }


  @override
  Future<int> create(User data) async{
    return await database.insert(User.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(User.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<User>> read() async{
    var rowsMaps = await database.query(User.TABLE_NAME);
    return rowsMaps.map((rowMap) => User.fromMap(rowMap)).toList();
  }

  @override
  Future<User?> show(int id) async{
    var data = await database.query(User.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => User.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(User data) async{
    int countOfUpdatedRows = await database.update(User.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }
}