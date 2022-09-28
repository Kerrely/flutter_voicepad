import 'package:voice_pad/data/models/voice_line.dart';

abstract class VoiceSelectionState {}

class VoiceSelectionInitialState extends VoiceSelectionState {}

class VoiceSelectionLoadingState extends VoiceSelectionState {}

class VoiceSelectionLoadedState extends VoiceSelectionState {
  final List<VoiceLine> voiceLines;

  VoiceSelectionLoadedState(this.voiceLines);
}

class VoiceSelectionPlayingState extends VoiceSelectionState {}

class VoiceSelectionFailState extends VoiceSelectionState {}
