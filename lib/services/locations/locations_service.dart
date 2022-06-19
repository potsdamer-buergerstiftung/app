import 'package:potsdamer_buergerstiftung/services/directus.dart';

class Location {
  int id;
  String name;

  Location({required this.name, required this.id});

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(name: map['name'], id: map['id']);
  }
}

class LocationsService {
  static Future<List<Location>> getLocations() async {
    var res = await directus.items("locations").readMany();
    return res.data.map((e) => Location.fromMap(e)).toList();
  }
}
