class DataResult<T> {
  final T? data;
  final Exception? error;

  DataResult({
    this.data,
    this.error,
  });

  bool get hasData => data != null;
  bool get hasError => error != null;
}
