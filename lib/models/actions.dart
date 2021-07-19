import 'package:budget_planner/models/db_table.dart';

class Action extends DbTable{
  late int id;
  late String amount;
  late String date;
  late bool expense;
  late String notes;
  late int userId;
  late int categoryId;
  late int currencyId;

  static const TABLE_NAME = 'actions';

  Action.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap) {
    id = rowMap['id'];
    amount = rowMap['amount'];
    date = rowMap['date'];
    expense = rowMap['expense'] == 1;
    notes = rowMap['notes'];
    userId = rowMap['userId'];
    categoryId = rowMap['categoryId'];
    currencyId = rowMap['currencyId'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['amount'] = amount;
    map['date'] = date;
    map['expense'] = expense ? 1 : 0;
    map['notes'] = notes;
    map['userId'] = userId;
    map['categoryId'] = categoryId;
    map['currencyId'] = currencyId;
    return map;
  }
}