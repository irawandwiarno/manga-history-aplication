import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exports.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbRes = await MangaDatabase().database;
  print('${dbRes}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: AppRoutes.pages,
      initialBinding: HomeBinding(),
    );
  }
}
