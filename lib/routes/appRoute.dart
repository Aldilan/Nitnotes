import 'package:get/get.dart';
import 'package:nitnotes/pages/homePage.dart';
import 'package:nitnotes/pages/formNotesPage.dart';
import 'package:nitnotes/routes/routesName.dart';

class AppPages {
  static const initialPage = RoutesName.homePage;
  static final routes = [
    GetPage(name: RoutesName.homePage, page: () => HomePage()),
    GetPage(
        name: RoutesName.formNotesPage + '/:cond?', page: () => FormNotesPage())
  ];
}
