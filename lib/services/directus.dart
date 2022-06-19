import 'package:directus/directus.dart';

late Directus directus;

Future<void> loadDirectus() async {
  directus = await Directus('https://cms.potsdamer-buergerstiftung.org').init();
}
