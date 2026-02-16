class AppResult<T> {
  final bool isSuccess;
  final String message;
  final T? data;

  AppResult({
    required this.isSuccess,
    required this.message,
    this.data,
  });

  factory AppResult.success({
    required String message,
    T? data,
  }) {
    return AppResult(
      isSuccess: true,
      message: message,
      data: data,
    );
  }

  factory AppResult.failure({
    required String message,
  }) {
    return AppResult(
      isSuccess: false,
      message: message,
    );
  }
}
