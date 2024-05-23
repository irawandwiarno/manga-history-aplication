import 'package:get/get.dart';
import 'package:manga_list/controllers/countC.dart';

class CountB implements Bindings {
  @override
  void dependencies() {
    Get.put(CountC());
  }
}
