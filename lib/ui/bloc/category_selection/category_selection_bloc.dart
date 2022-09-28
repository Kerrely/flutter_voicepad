import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/ui/bloc/category_selection/category_selection_event.dart';
import 'package:voice_pad/ui/bloc/category_selection/category_selection_state.dart';

class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  CategorySelectionBloc() : super(CategorySelectionInitialState()) {
    on<CategorySelectionLoadEvent>(_loadCategories);
    on<CategorySelectionAddCustomEvent>(_addCustomCategory);
  }

  FutureOr<void> _loadCategories(
    CategorySelectionLoadEvent event,
    Emitter<CategorySelectionState> emit,
  ) async {}

  // TODO:
  FutureOr<void> _addCustomCategory(CategorySelectionAddCustomEvent event,
      Emitter<CategorySelectionState> emit) async {
    throw UnimplementedError();
  }
}
