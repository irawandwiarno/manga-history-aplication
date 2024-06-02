import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_list/config/config.dart';
import 'package:manga_list/config/routes/route_name.dart';
import 'package:manga_list/exports.dart';

class HomePage extends GetView<HomeControler> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              BackgroundImageWidget(
                  width: screenWidth,
                  imagePath: "assets/foto/universal/bgatas.jpg"),
              Expanded(child: Container())
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: screenHight / 4,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: MyColors.whiteBg),
                child: Obx(() => controller.dataManga != null
                    ? ListView.builder(
                    itemCount: controller.dataManga.length,
                    itemBuilder: (context, index) => CardDisplayManga(manga: controller.dataManga[index]))
                    : Center(
                  child: CircularProgressIndicator(),
                )),
              ))
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.addMangaPage);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: MyColors.whiteNormal,
        ),
        backgroundColor: MyColors.primaryColor,
      ),
    );
  }
}
