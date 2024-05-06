class HttpResponse<T> {
  int statuscode;
  String message;
  T data;
  Map<String, String> responseHeaders;

  HttpResponse({
    required this.statuscode,
    required this.data,
    required this.message,
    required this.responseHeaders,
  });

  factory HttpResponse.fromJson(Map<String, dynamic> json) {
    return HttpResponse(
      statuscode: json['httpStatus'],
      data: json['data'],
      responseHeaders: json['responseHeaders'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "httpStatus": statuscode,
      "data": data,
      "message": message,
      "responseHeaders": responseHeaders
    };
  }
}
