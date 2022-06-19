import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final int index;

  String addZero(int number) {
    return number < 10 ? "0$number" : index.toString();
  }

  NavigationItem({super.key, required this.title, required this.index});

  final MainViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListTile(
          iconColor: TW3Colors.slate.shade900,
          horizontalTitleGap: 0,
          onTap: () {
            controller.setActiveIndex(index);
            Navigator.pop(context);
          },
          title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              addZero(index),
              style: TextStyle(
                  color: TW3Colors.slate.shade500,
                  fontSize: 10,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: controller.activeIndex.value == index
                        ? TW3Colors.emerald.shade500
                        : Colors.white,
                  ),
            ),
          ]));
    });
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: TW3Colors.slate.shade900,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 45),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/logo.svg",
                width: 150,
              ),
            ),
          ),
          const SizedBox(height: 20),
          NavigationItem(
            title: 'Veranstaltungen',
            index: 1,
          ),
          NavigationItem(
            title: "Verkauf",
            index: 2,
          )
        ],
      ),
    );
  }
}
