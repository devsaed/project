import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:get/get.dart';

class LanguageGetxController extends GetxController{

  RxString languageCode = 'ar'.obs;

  static LanguageGetxController get to => Get.find();

  @override
  void onInit() {
    languageCode.value = SharedPrefController().languageCode;
    super.onInit();
  }

  void changeLanguage(String newLanguageCode) {
    languageCode.value = newLanguageCode;
    print('NEW VALUE: ${languageCode.value}');
    SharedPrefController().setLanguage(newLanguageCode);
  }
}