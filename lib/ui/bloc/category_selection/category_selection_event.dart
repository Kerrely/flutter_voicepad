import 'package:voice_pad/data/models/voices_category.dart';

abstract class CategorySelectionEvent {}

class CategorySelectionLoadEvent extends CategorySelectionEvent {
  final CategorySelectionLoadType type;

  CategorySelectionLoadEvent([
    this.type = CategorySelectionLoadType.all,
  ]);
}

class CategorySelectionAddCustomEvent extends CategorySelectionEvent {
  final VoicesCategory category;

  CategorySelectionAddCustomEvent(this.category);
}

enum CategorySelectionLoadType { all, local, preset }
