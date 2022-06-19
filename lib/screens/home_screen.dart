import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/widgets/header.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_drawer.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';

class HomeViewController extends GetxController {
  @override
  void onInit() {
    print('>>> HomeViewController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> HomeViewController ready');
    super.onReady();
  }
}

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewController(), permanent: true);
  }
}

class HomeView extends GetView<HomeViewController> implements MainViewScreen {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home"));
  }

  @override
  PreferredSizeWidget? appBar = const Header(title: Text("Home"));
}
