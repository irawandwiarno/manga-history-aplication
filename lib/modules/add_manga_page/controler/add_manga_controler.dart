import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../add_manga_page.dart';
import '../../../exports.dart';

class AddMangaControler extends GetxController {
  int? id;
  String title = "No Title";
  int chapter = 0;
  String? link = null;
  String? poster = null;
  bool isUpdate = false;

  var argument = Get.arguments as int?;

  var controllerCardPreview = Get.find<CardPreviewMangaControler>();
  var controllerHome = Get.find<HomeControler>();

  TextEditingController titleController = TextEditingController();
  TextEditingController chapterController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController posterController = TextEditingController();

  @override
  void onInit() async {
    if (argument != null) {
      var res = await MangaDatabase().getMangaById(argument!);
      titleController.text = res!.title;
      chapterController.text = res.chapter.toString();
      linkController.text = res.link;
      posterController.text = res.posterLink!;
      isUpdate = true;

      onFromTitleChange();
      onFromChapterChange();
      onFromLinkChange();
      onFromPosterChange();
    }
    super.onInit();
  }

  void onFromTitleChange() {
    controllerCardPreview.title.value = titleController.text;
  }

  void onFromChapterChange() {
    if (chapterController.text != "" && chapterController.text != null) {
      controllerCardPreview.chapter.value =
          int.parse(chapterController.text.trim());
    } else {
      controllerCardPreview.chapter.value = 0;
    }
  }

  void onFromLinkChange() {
    controllerCardPreview.link.value = linkController.text;
  }

  void onFromPosterChange() {
    controllerCardPreview.posterLink.value = posterController.text;
  }

  Future createID() async {
    var randomID = Random().nextInt(10000).toString();
    var now = DateTime.now().microsecondsSinceEpoch.toString();
    var newID = int.parse((now + randomID).substring(0, 15));
    var res = await MangaDatabase().getMangaById(newID);
    if (await res == null) {
      return newID;
    }
    return await createID();
  }

  void clearForm() {
    titleController.text = "";
    chapterController.text = "";
    linkController.text = "";
    posterController.text = "";
    controllerCardPreview.clearForm();
  }

  Future<void> saveManga() async {
    if(!validateDataToSave()){
      return;
    }
    var id = isUpdate ? argument : await createID();
    MangaModel manga = MangaModel(
      id: id,
      title: controllerCardPreview.title.value,
      chapter: controllerCardPreview.chapter.value,
      link: controllerCardPreview.link.value,
      posterLink: controllerCardPreview.posterLink.value,
    );

    bool success = await performMangaOperation(manga, isUpdate);

    if (success) {
      print('Sukses simpan data');
      clearForm();
    } else {
      print('Gagal simpan data');
      // Handle failure case here, maybe retry logic or show error message
    }
    controllerHome.loadDataManga();
  }

  Future<bool> performMangaOperation(MangaModel manga, bool isUpdate) async {
    if (isUpdate) {
      return await MangaDatabase().updateManga(manga);
    } else {
      return await MangaDatabase().addManga(manga);
    }
  }

  bool validateDataToSave(){
    if(titleController.text == ""){
      SnackbarCommon().showErrorSnackbar("Title Tidak boleh kosong");
      return false;
    }
    if(chapterController.text == ""){
      SnackbarCommon().showErrorSnackbar("Chapter Tidak boleh kosong");
      return false;
    }
    if(linkController.text == ""){
      SnackbarCommon().showErrorSnackbar("link Tidak boleh kosong");
      return false;
    }

    return true;
  }
}
