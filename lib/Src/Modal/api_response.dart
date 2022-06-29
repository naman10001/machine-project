class ApiResponse {
  ApiResponse({
    this.statusCode,
    this.massage,
    this.data,
  });
  int? statusCode;
  String? massage;
  dynamic data;
}
