import '../add_manga_page.dart';
import '../../../exports.dart';

class AddMangaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CardPreviewMangaControler());
    Get.put(AddMangaControler());
  }
}