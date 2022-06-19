import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const Header({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainViewController controller = Get.find();
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.red,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Colors.white,
      titleTextStyle: Get.theme.textTheme.headline6,
      elevation: 1,
      title: title,
      leading: Container(
        margin: const EdgeInsets.only(left: 8),
        alignment: Alignment.center,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: TWColors.gray.shade100,
          child: IconButton(
            padding: const EdgeInsets.all(8),
            icon: Icon(
              Icons.menu,
              color: TW3Colors.slate.shade900,
              size: 22,
            ),
            onPressed: () {
              controller.openDrawer();
            },
          ),
        ),
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(58.0);
}
