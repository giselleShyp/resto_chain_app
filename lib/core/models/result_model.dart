class ResultModel<T> {
  final bool isSuccess;
  final String message;
  final T? data;

  ResultModel({
    required this.isSuccess,
    required this.message,
    this.data,
  });

  factory ResultModel.success({
    required String message,
    T? data,
  }) {
    return ResultModel(
      isSuccess: true,
      message: message,
      data: data,
    );
  }

  factory ResultModel.failure({
    required String message,
  }) {
    return ResultModel(
      isSuccess: false,
      message: message,
    );
  }
}
