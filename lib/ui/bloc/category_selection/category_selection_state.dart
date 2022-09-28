import 'package:voice_pad/data/models/voices_category.dart';

abstract class CategorySelectionState {}

class CategorySelectionInitialState extends CategorySelectionState {}

class CategorySelectionLoadingState extends CategorySelectionState {}

class CategorySelectionFailState extends CategorySelectionState {}

class CategorySelectionLoadedState extends CategorySelectionState {
  final List<VoicesCategory> categories;

  CategorySelectionLoadedState(this.categories);
}
