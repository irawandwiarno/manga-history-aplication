import 'package:manga_list/utils/controler/card_display_manga_controller.dart';
import '../../../exports.dart';

class CardDisplayManga extends StatelessWidget {
  CardDisplayManga({
    super.key,
    required this.manga,
  });

  final MangaModel manga;
  var controller = Get.find<CardDisplayMangaControler>();

  @override
  Widget build(BuildContext context) {
    print('${manga.title}');
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ], color: MyColors.whiteNormal, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverManga(manga.posterLink),
          Expanded(
            child: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleManga(manga.title),
                  ChapterManga(manga.chapter.toString()),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      ButtonReading(manga.link),
                      CommonIconButton(
                        color: MyColors.varianGreen,
                        iconData: Icons.edit,
                        onPressed: () => controller.editManga(manga.id),
                      ),
                      CommonIconButton(
                        color: MyColors.varianRed,
                        iconData: Icons.delete,
                        onPressed: () => controller.deleteManga(manga.id),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton ButtonReading(String link) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          controller.laucherURL(link);
        },
        child: Text(
          "Read",
          style: TextStyle(color: MyColors.whiteNormal),
        ));
  }

  Widget ChapterManga(String chapter) {
    return Container(
      height: 30,
      child: Row(
        children: [
          Text(
            "Chapter : ",
            style: MyText.subtitle(),
          ),
          Text(
            chapter,
            style: MyText.subtitle(),
          )
        ],
      ),
    );
  }

  Widget TitleManga(String title) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: GestureDetector(
          onTap: controller.setShowMore,
          child: Obx(
            () => Text(
              title,
              softWrap: true,
              style: MyText.title(),
              maxLines: controller.showMore.value ? 3 : 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
    );
  }

  Widget CoverManga(String? posterLink) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 160,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            posterLink ?? "https://www.peeters-leuven.be/covers/no_cover.gif",
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/foto/universal/no_cover.gif",
                fit: BoxFit.cover,
              );
            },
            fit: BoxFit.cover,
          )),
    );
  }
}

class CommonIconButton extends StatelessWidget {
  CommonIconButton({
    super.key,
    required this.color,
    required this.iconData,
    required this.onPressed,
  });

  Color color;
  IconData iconData;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: MyColors.whiteNormal,
        ));
  }
}
