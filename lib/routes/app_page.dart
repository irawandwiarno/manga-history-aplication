import 'package:get/get.dart';
import 'package:manga_list/bindings/countB.dart';
import 'package:manga_list/pages/count.dart';
import 'package:manga_list/pages/home.dart';
import 'package:manga_list/routes/route_name.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.count,
      page: () => CountPage(),
      binding: CountB(),
    ),
  ];
}
