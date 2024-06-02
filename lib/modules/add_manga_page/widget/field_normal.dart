import '../../../exports.dart';
import '../add_manga_page.dart';

class FieldNormal extends StatelessWidget {
  const FieldNormal(
      {super.key,
      required this.controller,
      required this.controllerText,
      required this.label,
      this.onlyNumber = false});

  final AddMangaControler controller;
  final TextEditingController controllerText;
  final String label;
  final bool onlyNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.whiteNormal,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controllerText,
        keyboardType: onlyNumber ? TextInputType.number : null,
        inputFormatters: onlyNumber
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)]
            : <TextInputFormatter>[LengthLimitingTextInputFormatter(100)],
        onChanged: (value) {
          controller.onFromChapterChange();
          controller.onFromTitleChange();
          controller.onFromLinkChange();
          controller.onFromPosterChange();
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: label,
            labelStyle: MyText.subtitle()),
      ),
    );
  }
}
