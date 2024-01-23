class ResponseData {
  ResponseData({
    required this.isSuccess,
    required this.statusCode,
    required this.responseBody,
    this.errorMessage = 'Something went wrong',
  });

  final bool isSuccess;
  final int statusCode;
  final String errorMessage;
  final dynamic responseBody;
}
