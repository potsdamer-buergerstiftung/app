import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/services/events/events_service.dart';
import 'package:potsdamer_buergerstiftung/widgets/event_card.dart';
import 'package:potsdamer_buergerstiftung/widgets/header.dart';
import 'package:potsdamer_buergerstiftung/widgets/main_view.dart';

class EventsController extends GetxController {
  var isLoading = true.obs;
  var events = <Event>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    events.value = await EventsService.getEvents();
    isLoading.value = false;
  }
}

class EventsScreen extends StatelessWidget implements MainViewScreen {
  EventsScreen({Key? key}) : super(key: key);

  final EventsController e = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (e.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListView.builder(
            itemCount: e.events.length,
            itemBuilder: (context, index) {
              final event = e.events[index];
              return Container(
                margin: const EdgeInsets.only(top: 8),
                child: EventCard(
                  name: event.name,
                  summary: event.summary,
                  imageUrl: event.imageUrl,
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  PreferredSizeWidget? appBar = Header(title: const Text("Veranstaltungen"));
}
