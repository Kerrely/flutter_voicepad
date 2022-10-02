import 'package:flutter/material.dart';
import 'package:voice_pad/data/repositories/preset_voices_repository.dart';
import 'package:voice_pad/ui/pages/voice_selection.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/injector.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final PresetVoicesRepository presetRepo = injector();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vojs pet'),
      ),
      body: ListView(
        controller: scrollController,
        children: [
          Text('PRESETS'),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: [
              for (final category in presetRepo.categories)
                GridItem(
                  title: category.title,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VoiceSelectionPage(
                          categoryIdentifier: category,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          Text('CUSTOM'),
        ],
      ),
    );
  }
}
