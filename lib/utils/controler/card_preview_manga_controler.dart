import '../../exports.dart';

class CardPreviewMangaControler extends GetxController {
  var canDirectToManga = false.obs;

  var title = "No Title".obs;
  var chapter = 0.obs;
  var link = "".obs;
  var posterLink = "".obs;

  Future<void> canLauncer(String link) async {
    if (await canLaunch(link)) {
      canDirectToManga.value = true;
      this.link.value = link;
    }
    canDirectToManga.value = false;
  }

  void clearForm() {
    title.value = "No Title";
    chapter.value = 0;
    link.value = "";
    posterLink.value = "";
  }
}
