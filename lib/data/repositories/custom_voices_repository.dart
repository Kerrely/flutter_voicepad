import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:voice_pad/data/data_result.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/voices_repository.dart';

class CustomVoicesRepository implements VoicesRepository {
  @override
  Future<DataResult<List<VoicesCategory>>> getCategories() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    final Directory voicesCategoriesDirectory =
        Directory('${appDocumentsDirectory.path}/voices');

    // Creates directory if it does not exist
    voicesCategoriesDirectory.createSync();

    // Gets subdirectories
    final categories = voicesCategoriesDirectory.listSync();

    return DataResult();
  }

  @override
  Future<DataResult<List<VoiceLine>>> getVoiceLinesByCategoryIdentifier(
    String category,
  ) {
    // TODO: implement getVoiceLinesForCategory
    throw UnimplementedError();
  }
}
