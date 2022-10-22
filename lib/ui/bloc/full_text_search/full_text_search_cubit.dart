import 'package:flutter_bloc/flutter_bloc.dart';

class FullTextSearchState {
  final bool isSearchEnabled;
  final String? searchValue;

  FullTextSearchState({
    required this.isSearchEnabled,
    this.searchValue,
  });

  FullTextSearchState copyWith({
    bool? isSearchEnabled,
    String? searchValue,
  }) =>
      FullTextSearchState(
        isSearchEnabled: isSearchEnabled ?? this.isSearchEnabled,
        searchValue: searchValue ?? this.searchValue,
      );
}

class FullTextSearchCubit extends Cubit<FullTextSearchState> {
  FullTextSearchCubit() : super(FullTextSearchState(isSearchEnabled: false));

  void toggleSearch() => emit(
        state.copyWith(isSearchEnabled: !state.isSearchEnabled),
      );

  void searchFor(String? value) => emit(state.copyWith(searchValue: value));
}
