import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/main.dart';
import 'package:potsdamer_buergerstiftung/screens/events_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/home_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/sales_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/test_screen.dart';

abstract class Routes {
  Routes._();

  static const home = "/";
  static const events = "/events";
  static const sales = "/sales";
}

class Screens {
  static final routes = [
    GetPage(
      name: "/home",
      page: () => HomeView(),
      binding: HomeViewBinding(),
    ),
    GetPage(
      name: "/test",
      page: () => TestView(),
      binding: TestViewBinding(),
    ),
  ];
}
