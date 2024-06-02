import 'package:get/get.dart';

import '../../exports.dart';

class CardDisplayMangaControler extends GetxController {
  RxBool showMore = false.obs;

  HomeControler homeControler = Get.find<HomeControler>();

  void setShowMore() {
    showMore.value = !showMore.value;
  }

  Future<void> laucherURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future editManga(int idManga) async {
    Get.toNamed(RouteName.addMangaPage, arguments: idManga);
  }

  void deleteManga(int idManga) async {
    await MyDialog().showConfirmDeleteMangaDialog("Apakah kamu yakin ingin menghapus Data ini?", idManga);
    homeControler.loadDataManga();
  }
}
