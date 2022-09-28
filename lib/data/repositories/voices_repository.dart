import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';

abstract class VoicesRepository {
  Future<List<VoicesCategory>> getCategories();

  Future<List<VoiceLine>> getVoiceLinesForCategory();
}
