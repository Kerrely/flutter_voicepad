import 'package:bloc/bloc.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/data/repositories/custom_voices_repository.dart';
import 'package:voice_pad/data/repositories/preset_voices_repository.dart';
import 'package:voice_pad/utils/injector.dart';
import 'package:voice_pad/utils/page_state.dart';

class CategorySelectionCubit extends Cubit<PageState<List<VoicesCategory>>> {
  CategorySelectionCubit() : super(PageState(data: null));

  Future<void> getCategories() async {
    emit(state.copyWith(isLoading: true));

    final PresetVoicesRepository presetRepo = injector();
    final CustomVoicesRepository customRepo = injector();

    final categories = List<VoicesCategory>.empty(growable: true);

    final presetCategories = await presetRepo.getCategories();
    categories.addAll(presetCategories);
    final customCategories = await customRepo.getCategories();
    categories.addAll(customCategories);

    emit(state.copyWith(isLoading: false, data: categories));
  }
}
