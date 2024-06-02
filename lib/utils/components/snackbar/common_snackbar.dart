import '../../../exports.dart';

class SnackbarCommon{
  void showErrorSnackbar(String errorMessage) {
    Get.snackbar(
      "Gagal",
      errorMessage,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}