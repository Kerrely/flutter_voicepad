import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/voices_repository.dart';

class CustomVoicesRepository implements VoicesRepository {
  @override
  Future<List<VoicesCategory>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<VoiceLine>> getVoiceLinesForCategory(String category) {
    // TODO: implement getVoiceLinesForCategory
    throw UnimplementedError();
  }
}
