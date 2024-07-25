import 'package:e_quran/features/home/presentation/view/home.view.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const home = '/home';
}

class RouterPage {
  static final routes = [
    GetPage(name: Routes.home, page: () => const HomeView()),
  ];
}
