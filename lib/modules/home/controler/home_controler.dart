import 'dart:ffi';

import 'package:manga_list/exports.dart';
import '../home.dart';

class HomeControler extends GetxController {
  RxList<MangaModel> dataManga = RxList<MangaModel>();

  @override
  void onInit() async {
    super.onInit();
    updateDataManga();
  }

  void updateDataManga() async {
    dataManga.value = await MangaDatabase().getAllMangas();
  }

  void loadDataManga() async {
    dataManga.value = await MangaDatabase().getAllMangas();
  }
}
