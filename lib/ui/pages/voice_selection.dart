import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/preset_voices_provider.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/injector.dart';

class VoiceSelectionPage extends StatelessWidget {
  final VoicesCategory category;

  const VoiceSelectionPage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PresetVoicesProvider dataProvider = injector();

    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width > 500 ? 5 : 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          for (final voice in dataProvider.voices
              .where((element) => element.category == category.identifier))
            GridItem(
              title: voice.title.replaceAll('.mp4', ''),
              onTap: () {
                Audio.load('assets/voices/${voice.category}/${voice.file}')
                  ..play()
                  ..dispose();
              },
            )
        ],
      ),
    );
  }
}
