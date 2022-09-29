import 'dart:collection';
import 'dart:convert';

import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';

class PresetVoicesProvider {
  final List<VoicesCategory> categories;
  final List<VoiceLine> voices;

  PresetVoicesProvider(this.categories, this.voices);

  factory PresetVoicesProvider.fromManifest(String manifest) {
    final assetMap = jsonDecode(manifest);

    final voiceAssets = assetMap.keys
        .where((String key) => key.startsWith('assets/voices'))
        .toList();

    final List<VoiceLine> voiceLines = List<VoiceLine>.empty(growable: true);
    final HashSet<String> categoryNames = HashSet();

    for (int i = 0; i < voiceAssets.length; i++) {
      final decodedAsset = Uri.decodeFull(voiceAssets[i]).substring(14);
      final voicePair = decodedAsset.split('/');

      categoryNames.add(voicePair.first);
      voiceLines.add(VoiceLine(
        i,
        Uri.encodeFull(voicePair.first),
        Uri.encodeFull(voicePair.last),
        voicePair.last,
      ));
    }

    final List<VoicesCategory> categories = categoryNames
        .map((e) => VoicesCategory(title: e, category: Uri.encodeFull(e)))
        .toList();

    return PresetVoicesProvider(categories, voiceLines);
  }
}
