import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:voice_pad/data/data_provider.dart';
import 'package:voice_pad/data/models/category.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/injector.dart';

class VoiceSelectionPage extends StatelessWidget {
  final Category category;

  const VoiceSelectionPage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = injector();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (final voice in dataProvider.voices
                .where((element) => element.category == category.id))
              GridItem(
                title: voice.title,
                onTap: () {
                  Audio.load('assets/voices/${voice.file}')
                    ..play()
                    ..dispose();
                },
              )
          ],
        ),
      ),
    );
  }
}
