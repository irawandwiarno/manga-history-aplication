import 'package:get/get.dart';
import 'package:manga_list/modules/add_manga_page/add_manga_page.dart';
import 'package:manga_list/modules/count/binding/count_binding.dart';
import 'package:manga_list/config/routes/route_name.dart';
import '../../modules/modules.dart';

class AppRoutes {
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
    GetPage(
        name: RouteName.addMangaPage,
        page: () => AddMangaView(),
        binding: AddMangaBinding()
    ),
  ];
}
