import 'package:budget_planner/database/controllers/currency_db_controller.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:get/get.dart';

class CurrencyGetxController extends GetxController {

  List<Currency> currencies = [];
  CurrencyDbController dbController = CurrencyDbController();
  static CurrencyGetxController get to => Get.find();

  @override
  void onInit() {
    readCurrencies();
    super.onInit();
  }

  @override
  void onClose() {
    currencies.clear();
    super.onClose();
  }

  Future<void> readCurrencies() async {
    currencies = await dbController.read();
    update();
  }

  Future<bool> updateNote(Currency updatedCurrency) async {
    bool updated = await dbController.update(updatedCurrency);
    if(updated){
      int index = currencies.indexWhere((element) => element.id == updatedCurrency.id);
      if(index != -1){
        currencies[index] = updatedCurrency;
        update();
        return true;
      }
    }
    return false;
  }
}