import '../../../exports.dart';

class MyDialog {
  Future showConfirmDeleteMangaDialog(String message, int idManga) {
    return Get.dialog(
      AlertDialog(
        title: Text('Konfirmasi Penghapusan', style: MyText.h3(),),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Tidak', style: MyText.title(color: MyColors.varianRed)),
            onPressed: () {
              Get.back(); // Tutup dialog
            },
          ),
          TextButton(
            child: Text('Ya', style: MyText.title(color: MyColors.varianGreen)),
            onPressed: () async{
              var res = await MangaDatabase().deleteManga(idManga);
              Get.back(); // Tutup dialog
            },
          ),
        ],
      ),
    );
  }

}