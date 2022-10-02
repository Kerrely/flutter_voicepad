class PageState<T> {
  final T? data;
  final bool isLoading;
  final bool fatalErrorOccurred;

  PageState({
    required this.data,
    this.isLoading = false,
    this.fatalErrorOccurred = false,
  });

  PageState<T> copyWith({
    T? data,
    bool? isLoading,
    bool? fatalErrorOccurred,
  }) =>
      PageState(
        data: data,
        isLoading: isLoading ?? this.isLoading,
        fatalErrorOccurred: fatalErrorOccurred ?? this.fatalErrorOccurred,
      );
}
