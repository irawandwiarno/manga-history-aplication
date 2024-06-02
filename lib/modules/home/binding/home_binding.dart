import '../home.dart';
import '../../../exports.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeControler());
    Get.create(()=>CardDisplayMangaControler());
  }
}