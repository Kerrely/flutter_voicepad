import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/custom_voices_repository.dart';
import 'package:voice_pad/data/repositories/preset_voices_repository.dart';
import 'package:voice_pad/data/repositories/voices_repository.dart';
import 'package:voice_pad/utils/injector.dart';
import 'package:voice_pad/utils/page_state.dart';

class VoiceSelectionState extends PageState<List<VoiceLine>> {
  final bool isPlaying;

  VoiceSelectionState({
    this.isPlaying = false,
    required super.data,
    super.errorOccurred,
    super.isLoading,
  });

  @override
  VoiceSelectionState copyWith({
    List<VoiceLine>? data,
    bool? isLoading,
    bool? errorOccurred,
    bool? isPlaying,
  }) =>
      VoiceSelectionState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        errorOccurred: errorOccurred ?? this.errorOccurred,
        isPlaying: isPlaying ?? this.isPlaying,
      );
}

class VoiceSelectionCubit extends Cubit<VoiceSelectionState> {
  VoiceSelectionCubit() : super(VoiceSelectionState(data: null));

  Future<void> getVoicesForCategory(VoicesCategory category) async {
    emit(state.copyWith(isLoading: true));

    late final VoicesRepository repo;
    switch (category.type) {
      case VoicesCategoryType.custom:
        repo = injector<CustomVoicesRepository>();
        break;
      case VoicesCategoryType.preset:
        repo = injector<PresetVoicesRepository>();
        break;
    }

    final voicesResult = await repo.getVoiceLinesByCategoryIdentifier(
      category.identifier,
    );

    emit(state.copyWith(
        isLoading: false,
        data: voicesResult.data ?? state.data,
        errorOccurred: voicesResult.hasError));
  }

  void playVoiceLine({
    required String category,
    required String file,
  }) {
    emit(state.copyWith(isPlaying: true));
    Audio.load('assets/voices/$category/$file',
        onComplete: () => emit(state.copyWith(isPlaying: false)))
      ..play()
      ..dispose();
  }
}
