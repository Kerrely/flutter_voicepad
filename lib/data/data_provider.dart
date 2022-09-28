import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';

class DataProvider {
  late final List<VoicesCategory> categories;
  late final List<VoiceLine> voices;

  DataProvider() {
    final mafiaIICategory = VoicesCategory('mafiaII', 'Mafia II');

    categories = [
      mafiaIICategory,
    ];
    voices = [
      VoiceLine(
        'tovypadazajimave',
        'mafiaII/tovypadazajimave.mp4',
        'To vypadá zajímavě, nechceš si vsadit?',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'alenojo',
        'mafiaII/alenojo.mp4',
        'Ale no jo',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'jauzjsemnatyhlesrackystary',
        'mafiaII/jauzjsemnatyhlesrackystary.mp4',
        'Já už jsem na tyhle sračky starý',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'nicuzkurvanefunguje',
        'mafiaII/nicuzkurvanefunguje.mp4',
        'Nic už kurva nefunguje',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'jdidomu',
        'mafiaII/jdidomu.mp4',
        'Jdi domů',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'tojeblby',
        'mafiaII/tojeblby.mp4',
        'To je blbý',
        mafiaIICategory.id,
      ),
      VoiceLine(
        'tyseszblaznil',
        'mafiaII/tyseszblaznil.mp4',
        'Ty ses zbláznil',
        mafiaIICategory.id,
      ),
    ];
  }
}
