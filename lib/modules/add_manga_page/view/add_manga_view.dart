import 'package:manga_list/modules/add_manga_page/add_manga_page.dart';
import 'package:manga_list/utils/components/cards/card_preview_manga.dart';

import '../../../exports.dart';

class AddMangaView extends GetView<AddMangaControler> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Stack(children: [
            BackgroundImageWidget(
                width: screenWidth,
                imagePath: "assets/foto/universal/bgatas.jpg"),
            CardPreviewManga()
          ]),
          Column(
            children: [
              SizedBox(
                height: screenHight / 3.5,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: MyColors.whiteBg),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    FieldNormal(
                      controller: controller,
                      controllerText: controller.titleController,
                      label: "Title",
                    ),
                    FieldNormal(
                      controller: controller,
                      controllerText: controller.chapterController,
                      label: "Chapter",
                      onlyNumber: true,
                    ),
                    FieldNormal(
                      controller: controller,
                      controllerText: controller.linkController,
                      label: "Link Last Read",
                    ),
                    FieldNormal(
                      controller: controller,
                      controllerText: controller.posterController,
                      label: "Link Poster/Cover",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonButton(
                      labelText: "Simpan",
                      onPressed: (){
                        controller.saveManga();
                      },
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      )),
    );
  }
}

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  String labelText;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: MyText.title(color: MyColors.whiteNormal),
        ));
  }
}
