import 'package:flutter_bloc/flutter_bloc.dart';
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

    final customCategoriesResult = await customRepo.getCategories();
    final presetCategoriesResult = await presetRepo.getCategories();
    if (presetCategoriesResult.hasData) {
      categories.addAll(presetCategoriesResult.data!);
    }
    if (customCategoriesResult.hasData) {
      categories.addAll(customCategoriesResult.data!);
    }

    emit(state.copyWith(
      isLoading: false,
      data: categories,
      errorOccurred: presetCategoriesResult.hasError,
    ));
  }
}
