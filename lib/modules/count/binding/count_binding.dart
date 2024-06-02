import 'package:get/get.dart';
import '../count.dart';

class CountB implements Bindings {
  @override
  void dependencies() {
    Get.put(CountC());
  }
}
