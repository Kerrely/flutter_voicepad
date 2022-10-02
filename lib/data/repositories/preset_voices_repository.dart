import 'dart:collection';
import 'dart:convert';

import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/voices_repository.dart';

class PresetVoicesRepository implements VoicesRepository {
  final List<VoicesCategory> _categories;
  final List<VoiceLine> _voices;

  PresetVoicesRepository(this._categories, this._voices);

  /// Takes all files/categories from `assets/voices` and prepares them for use
  /// in local [_categories] and [_voices] variables.
  ///
  /// Repository getters are available for retrieving those values.
  ///
  /// Stored preset voices must be in exact format:
  ///  - located within one category
  ///  - category must be in `assets/voices` folder
  ///
  /// Example:
  /// ```
  /// assets/voices/Viva la dirt league/What can I do you for.mp3
  /// ```
  factory PresetVoicesRepository.fromManifest(String manifest) {
    final assetMap = jsonDecode(manifest);

    final voiceAssets = assetMap.keys
        .where((String key) => key.startsWith('assets/voices'))
        .toList();

    final List<VoiceLine> voiceLines = List<VoiceLine>.empty(growable: true);
    final HashSet<String> categoryNames = HashSet();

    for (int i = 0; i < voiceAssets.length; i++) {
      // Substring so it returns only category/voiceline.type
      final decodedAsset = Uri.decodeFull(voiceAssets[i]).substring(14);
      final voicePair = decodedAsset.split('/');

      categoryNames.add(voicePair.first);
      voiceLines.add(VoiceLine(
        id: i,
        category: Uri.encodeFull(voicePair.first),
        file: Uri.encodeFull(voicePair.last),
        title: voicePair.last,
      ));
    }

    final List<VoicesCategory> categories = categoryNames
        .map((e) => VoicesCategory(
              title: e,
              identifier: Uri.encodeFull(e),
              type: VoicesCategoryType.preset,
            ))
        .toList();

    return PresetVoicesRepository(categories, voiceLines);
  }

  @override
  Future<List<VoicesCategory>> getCategories() {
    return Future.value(_categories);
  }

  @override
  Future<List<VoiceLine>> getVoiceLinesByCategoryIdentifier(String category) {
    return Future.value(
      _voices.where((element) => element.category == category).toList(),
    );
  }
}
