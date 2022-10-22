import 'package:voice_pad/data/data_result.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';

abstract class VoicesRepository {
  Future<DataResult<List<VoicesCategory>>> getCategories();

  Future<DataResult<List<VoiceLine>>> getVoiceLinesByCategoryIdentifier(
    String category,
  );
}
