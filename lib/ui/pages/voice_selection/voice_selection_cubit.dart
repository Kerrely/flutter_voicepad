import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/custom_voices_repository.dart';
import 'package:voice_pad/data/repositories/preset_voices_repository.dart';
import 'package:voice_pad/data/repositories/voices_repository.dart';
import 'package:voice_pad/utils/injector.dart';
import 'package:voice_pad/utils/page_state.dart';

class VoiceSelectionCubit extends Cubit<PageState<List<VoiceLine>?>> {
  VoiceSelectionCubit(): super(PageState(data: null));

  void getVoicesForCategory(VoicesCategory category) {
    emit(state.copyWith)

    late final VoicesRepository repo;
    switch (category.type) {
      case VoicesCategoryType.custom:
        repo = injector<CustomVoicesRepository>();
        break;
      case VoicesCategoryType.preset:
        repo = injector<PresetVoicesRepository>();
        break;
    }
  }

}