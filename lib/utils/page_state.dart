import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PageState<T> {
  final T data;
  final bool isLoading;
  final bool fatalErrorOccurred;

  PageState({
    required this.data,
    this.isLoading = false,
    this.fatalErrorOccurred = false,
  });

  PageState copyWith(
      {
        T data,
        this.isLoading = false,
        this.fatalErrorOccurred = false,
      }
      )
}
