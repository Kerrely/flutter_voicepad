import 'package:voice_pad/data/models/voice_line.dart';

abstract class VoiceSelectionEvent {}

class VoiceSelectionPlayEvent extends VoiceSelectionEvent {
  final VoiceLine selectedVoiceLine;

  VoiceSelectionPlayEvent(this.selectedVoiceLine);
}

// TODO
class VoiceSelectionAddCustomEvent extends VoiceSelectionEvent {}
