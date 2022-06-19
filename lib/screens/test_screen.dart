import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/widgets/header.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_drawer.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';

class TestViewController extends GetxController {
  final title = 'Page 1';

  @override
  void onInit() {
    print('>>> TestViewController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> TestViewController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> TestViewController close');
    super.onClose();
  }
}

class TestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestViewController());
  }
}

class TestView extends GetView<TestViewController> implements MainViewScreen {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Testchen"));
  }

  @override
  PreferredSizeWidget? appBar = const Header(title: Text("Test"));
}
