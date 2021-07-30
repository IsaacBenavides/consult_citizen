import 'package:consult_citizen/app/pages/form/form_controller.dart';
import 'package:consult_citizen/app/repository/api_repository.dart';
import 'package:get/get.dart';

class DependendyInjection {
  static init() {
    Get.lazyPut<ApiRepository>(() => ApiRepository(), fenix: true);
    Get.lazyPut<FormController>(() => FormController(), fenix: true);
  }
}
