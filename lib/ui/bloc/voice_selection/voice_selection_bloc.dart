import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/ui/bloc/voice_selection/voice_selection_event.dart';
import 'package:voice_pad/ui/bloc/voice_selection/voice_selection_state.dart';

class VoiceSelectionBloc
    extends Bloc<VoiceSelectionEvent, VoiceSelectionState> {
  VoiceSelectionBloc() : super(VoiceSelectionInitialState()) {
    on<VoiceSelectionPlayEvent>(_playVoiceLine);
    on<VoiceSelectionAddCustomEvent>(_addCustomVoiceLine);
  }

  FutureOr<void> _playVoiceLine(
      VoiceSelectionPlayEvent event, Emitter<VoiceSelectionState> emit) async {}

  // TODO:
  FutureOr<void> _addCustomVoiceLine(VoiceSelectionAddCustomEvent event,
      Emitter<VoiceSelectionState> emit) async {
    throw UnimplementedError();
  }
}
