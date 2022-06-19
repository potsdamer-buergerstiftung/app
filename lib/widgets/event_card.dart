import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:transparent_image/transparent_image.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String summary;
  final String? imageUrl;

  const EventCard(
      {Key? key, required this.name, required this.summary, this.imageUrl})
      : super(key: key);

  Widget eventImage() {
    if (imageUrl == null) {
      return const SizedBox(height: 0);
    }
    return Container(
      constraints: const BoxConstraints.expand(height: 200),
      child: FadeInImage.memoryNetwork(
        fit: BoxFit.cover,
        placeholder: kTransparentImage,
        image:
            "https://cms.potsdamer-buergerstiftung.org/assets/$imageUrl?height=200&width=400&quality=60",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TWColors.gray.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          eventImage(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("16. Juni"),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                Text(
                  summary,
                  maxLines: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Mehr Infos"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
