class ApiResponse<T> {
  final int? statusCode;
  final bool? success;
  final String? message;
  final T? body;

  ApiResponse({
    this.statusCode,
    this.success,
    this.message,
    this.body,
  }) {
    if (statusCode == StatusCodes.tooManyRequests) {
      print("======================================================");
      print("TOO MANY REQUEST");
      print("======================================================");
      print(this.runtimeType.toString());
    }
  }

  bool get failure => !(success ?? false);
}

class StatusCodes {
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int unprocessableEntity = 422;
  static const int internalServerError = 500;
  static const int tooManyRequests = 429;
}

