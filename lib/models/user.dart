import 'db_table.dart';

class User extends DbTable {

  static const TABLE_NAME = 'users';


  late int id;
  late String name;
  late String email;
  late int currencyId;
  late double dayLimit;
  late int pin;


  User();

  User.fromMap(Map<String, dynamic> rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    currencyId = rowMap['currency_id'];
    dayLimit = rowMap['day_limit'];
    pin = rowMap['pin'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['currency_id'] = currencyId;
    map['day_limit'] = dayLimit;
    map['pin'] = pin;
    return map;
  }

  String display() {
    return 'User{id: $id, name: $name, email: $email, currencyId: $currencyId, dayLimit: ${dayLimit.runtimeType}., pin: $pin}';
  }
}
