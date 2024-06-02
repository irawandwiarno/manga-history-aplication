import 'package:manga_list/utils/controler/card_preview_manga_controler.dart';

import '../../../exports.dart';

class CardPreviewManga extends GetView<CardPreviewMangaControler> {
  CardPreviewManga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: MyColors.whiteNormal, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverManga(controller.posterLink),
          Expanded(
            child: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleManga(controller.title),
                  ChapterManga(controller.chapter),
                  Expanded(child: Container()),
                  ButtonReading()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ButtonReading() {
    return Obx(()=>ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.canDirectToManga.value ? MyColors.primaryColor: MyColors.disableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Reading",
          style: TextStyle(color: MyColors.whiteNormal),
        )));
  }

  Widget ChapterManga(Rx<int>? chapter) {
    return Container(
      height: 30,
      child: Row(
        children: [
          Text(
            "Chapter : ",
            style: MyText.subtitle(),
          ),
          Obx(()=>Text(
              (chapter?.value!= null && chapter!.value.toString().trim() != "") ? chapter.value.toString() : "0",
            style: MyText.subtitle(),
          ))
        ],
      ),
    );
  }

  Widget TitleManga(Rx<String>? title) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: Obx(
        () => Text(
          (title?.value!= null && title!.value.trim() != "") ? title.value : "No Title",
          softWrap: true,
          style: MyText.title(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget CoverManga(Rx<String>? posterLink) {
    return Stack(
      children: [
        Container(width: 135, height: 160,),
        Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 160,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Obx(()=>Image.network(
              posterLink?.value ?? "https://www.peeters-leuven.be/covers/no_cover.gif",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/foto/universal/no_cover.gif",
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
            ))),
      ),]
    );
  }
}
