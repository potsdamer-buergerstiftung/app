import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potsdamer_buergerstiftung/screens/events_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/sales_screen.dart';
import 'package:potsdamer_buergerstiftung/screens/screens.dart';
import 'package:potsdamer_buergerstiftung/services/directus.dart';
import 'package:potsdamer_buergerstiftung/widgets/header.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_drawer.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    GetMaterialApp(
      home: const Home(),
      getPages: Screens.routes,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w700,
          ),
          headline6: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w700,
          ),
          bodyText1: GoogleFonts.inter(fontWeight: FontWeight.w400),
          bodyText2: GoogleFonts.inter(fontWeight: FontWeight.w400),
        ),
        primaryColor: TW3Colors.emerald.shade500,
        primarySwatch: Colors.green,
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MainView();
  }
}
