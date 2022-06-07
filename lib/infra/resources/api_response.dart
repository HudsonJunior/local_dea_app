abstract class ApiResponse<T> {}

class SuccessApiResponse<T> extends ApiResponse<T> {
  final T data;

  SuccessApiResponse({
    required this.data,
  });
}

class FailApiResponse<T> extends ApiResponse<T> {
  final String error;

  FailApiResponse({
    required this.error,
  });
}
