import 'package:directus/directus.dart';
import 'package:potsdamer_buergerstiftung/services/directus.dart';

class Event {
  String name;
  String summary;
  String? description;
  String? imageUrl;

  Event(
      {required this.name,
      required this.summary,
      this.description,
      this.imageUrl});

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
        name: map['name'], summary: map['summary'], imageUrl: map['image']);
  }
}

class EventsService {
  static Future<List<Event>> getEvents() async {
    var res = await directus
        .items("events")
        .readMany(filters: Filters({"start": F.gte(r'$NOW')}));
    return res.data.map((e) => Event.fromMap(e)).toList();
  }
}
