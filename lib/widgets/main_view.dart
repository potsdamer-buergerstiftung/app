import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/screens/events_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/home_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/test_screen.dart';
import 'package:potsdamer_buergerstiftung/services/directus.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_drawer.dart';

class MainViewController extends GetxController {
  var activeIndex = 0.obs;
  var directusLoaded = false.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  MainViewScreen getPage() {
    switch (activeIndex.value) {
      case 1:
        return EventsScreen();
      case 2:
        return TestView();
      default:
        return HomeView();
    }
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadDirectus();
    directusLoaded.value = true;
  }
}

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final MainViewController controller = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.directusLoaded.value) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          drawer: const MainDrawer(),
          key: controller.scaffoldKey,
          body: controller.getPage(),
          appBar: controller.getPage().appBar,
        );
      },
    );
  }
}

abstract class MainViewScreen extends StatelessWidget {
  MainViewScreen({Key? key}) : super(key: key);

  abstract PreferredSizeWidget? appBar;
}
