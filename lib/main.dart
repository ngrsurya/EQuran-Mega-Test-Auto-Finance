import 'package:e_quran/core/utils/material/global_context/global_context.dart';
import 'package:e_quran/core/utils/screen_utils/screen_utils.dart';
import 'package:e_quran/features/home/presentation/view/home.view.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/resources/injector/injector_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/router.dart';

void main() {
  initApp();
}

void initApp() async {
  ScreenUtil.init();
  WidgetsFlutterBinding.ensureInitialized();
  // prefInstance = await SharedPreferences.getInstance();
  await injector.init();
  runApp(const MainApp()
      // DevicePreview(builder: (context) => const MainApp()),
      );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      navigatorKey: NavigationService.navigatorKey,
      // theme: buildThemeData(),
      getPages: RouterPage.routes,
    ));
  }
}
