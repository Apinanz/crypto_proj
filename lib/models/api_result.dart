class ApiResult {
  final int error;
  final List<dynamic>result;

  ApiResult({
    required this.error,
    required this.result
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
      error: json['error'],
      result: json['result']
    );
  }
}