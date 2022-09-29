import 'package:flutter/material.dart';
import 'package:voice_pad/data/preset_voices_provider.dart';
import 'package:voice_pad/ui/pages/voice_selection.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/injector.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final PresetVoicesProvider dataProvider = injector();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vojs pet'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (final category in dataProvider.categories)
              GridItem(
                title: category.title,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VoiceSelectionPage(
                        category: category,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
