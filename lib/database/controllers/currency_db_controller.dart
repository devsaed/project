import 'package:budget_planner/database/db_operations.dart';
import 'package:budget_planner/models/currency.dart';
import '../db_provider.dart';

class CurrencyDbController extends DbOperations<Currency>  {


  CurrencyDbController(){
    database = DBProvider().database;
  }

  @override
  Future<int> create(Currency data) async{
    return await database.insert(Currency.TABLE_NAME, data.toMap());
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeletedRows = await database.delete(Currency.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows != 0;
  }

  @override
  Future<List<Currency>> read() async{
    var rowsMaps = await database.query(Currency.TABLE_NAME);
    return rowsMaps.map((rowMap) => Currency.fromMap(rowMap)).toList();
  }

  @override
  Future<Currency?> show(int id) async {
    var data = await database.query(Currency.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
    return data.isNotEmpty ? data.map((rowMap) => Currency.fromMap(rowMap)).first : null;
  }

  @override
  Future<bool> update(Currency data) async {
    int countOfUpdatedRows = await database.update(Currency.TABLE_NAME, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
    return countOfUpdatedRows != 0;
  }


}