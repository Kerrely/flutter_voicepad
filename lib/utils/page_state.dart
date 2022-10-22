class PageState<T> {
  final T? data;
  final bool isLoading;
  final bool errorOccurred;

  PageState({
    required this.data,
    this.isLoading = false,
    this.errorOccurred = false,
  });

  PageState<T> copyWith({
    T? data,
    bool? isLoading,
    bool? errorOccurred,
  }) =>
      PageState(
        data: data,
        isLoading: isLoading ?? this.isLoading,
        errorOccurred: errorOccurred ?? this.errorOccurred,
      );
}
