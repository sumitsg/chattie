import 'dart:convert';

import 'package:chattie/common/network/http_extensions.dart';
import 'package:chattie/common/network/http_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class HttpClient {
  Future<HttpResponse> get({
    required String url,
    required Map<String, String> headers,
    Map<String, String>? queryParams,
    bool isContentTypeJson = false,
  });

  Future<HttpResponse> delete({
    required String url,
    required Map<String, String>? headers,
    dynamic body,
    String? deviceId,
    bool isContentTypeJson = false,
  });

  Future<HttpResponse> post(
      {required String url,
      required dynamic body,
      required Map<String, String> headers,
      bool isContentTypeJson = false});

  Future<HttpResponse> put({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
    bool isContentTypeJson = false,
  });

  Future<HttpResponse> postMultipart({
    required String url,
    required Map<String, String> headers,
    required String filePath,
    String? deviceId,
    bool isDigioRequest = false,
    bool isContentTypeJson = false,
  });
}

class HttpClientImpl extends HttpClient {
  HttpClientImpl.internal();

  static final HttpClientImpl instance = HttpClientImpl.internal();

  factory HttpClientImpl() => instance;

  // get method for API
  @override
  Future<HttpResponse> get({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    bool isContentTypeJson = false,
    bool isJsonDecodeRequired = true,
    bool messageVisibility = true,
  }) async {
    // remove this token in fin
    // al code else it will create null error
    // print(headers);

    // http.Client;

    HttpResponse httpResponse;

    final parsedUrl = Uri.parse(url);

    Map<String, String> params = {};
    params.addAll(parsedUrl.queryParameters);
    queryParams ??= {};
    params.addAll(queryParams);

    try {
      // log('HttpClient GET');
      // log('${parsedUrl.replace(queryParameters: params)}');

      var request = http.get(
        // Uri.parse(url),
        parsedUrl.replace(queryParameters: params),
        headers:
            await getHeader(headers, url, isContentTypeJson: isContentTypeJson),
      );

      Response response = await request;

      httpResponse = await responseHandler(response,
          request: request,
          isJsonDecodeRequire: isJsonDecodeRequired,
          messageVisibility: messageVisibility);
    } catch (e) {
      if (e is UnauthorisedException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is BadRequestException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is FetchDataException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is RetryException) {
        return get(
            url: url,
            queryParams: queryParams,
            isContentTypeJson: isContentTypeJson,
            headers: headers);
      } else {
        httpResponse = HttpResponse(
          data: null,
          statuscode: 0,
          message: e.toString(),
          responseHeaders: {},
        );
      }
    } finally {
      //client.close();
    }
    return httpResponse;
  }

  // POST method for API
  @override
  Future<HttpResponse> post(
      {required String url,
      required body,
      required Map<String, String> headers,
      bool isContentTypeJson = false}) async {
    HttpResponse httpResponse;
    try {
      var request = http.post(
        Uri.parse(url),
        headers: await getHeader(
          headers,
          url,
          isContentTypeJson: isContentTypeJson,
        ),
        body: json.encode(body),
      );

      Response response = await request;
      // log('HttpClient POST');
      // log('${Uri.parse(url)}');
      // log("POST Response statusCode ${response.statusCode}");

      httpResponse = await responseHandler(
        response,
        request: request,
      );
    } catch (e) {
      // debugPrint("Exception IN  POST Request ${e.toString()}");
      if (e is UnauthorisedException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is BadRequestException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is NotFoundException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is RetryException) {
        return post(
          url: url,
          body: body,
          isContentTypeJson: isContentTypeJson,
          headers: headers,
        );
      } else {
        httpResponse = HttpResponse(
          data: null,
          statuscode: 0,
          message: e.toString(),
          responseHeaders: {},
        );
      }
    } finally {
      //client.close();
    }
    return httpResponse;
  }

  // delete method for API
  @override
  Future<HttpResponse> delete(
      {required String url,
      required Map<String, String>? headers,
      body,
      String? deviceId,
      bool isContentTypeJson = false}) async {
    HttpResponse httpResponse;

    try {
      // log('HttpClient DELETE');
      // log('${Uri.parse(url)}');
      // log(json.encode(body));

      var request = http.delete(
        Uri.parse(url),
        headers: await getHeader(
          headers,
          url,
          isContentTypeJson: isContentTypeJson,
        ),
        body: json.encode(body),
      );

      Response response = await request;

      httpResponse = await responseHandler(response, request: request);
      // debugPrint(
      //     "DELETE RESPONSE : Status : ${httpResponse.statuscode}, DATA : ${httpResponse.data} , HEADER : ${httpResponse.responseHeaders}");
    } catch (e) {
      // debugPrint("EXCEPTION IN Delete $e");
      if (e is UnauthorisedException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is BadRequestException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is NotFoundException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: 0,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is RetryException) {
        return delete(
          url: url,
          isContentTypeJson: isContentTypeJson,
          headers: headers,
          deviceId: deviceId,
          body: body,
        );
      } else {
        httpResponse = HttpResponse(
          data: null,
          statuscode: 0,
          message: e.toString(),
          responseHeaders: {},
        );
      }
    } finally {
      //client.close();
    }
    return httpResponse;
  }

  // post multippart method for API
  @override
  Future<HttpResponse> postMultipart(
      {required String url,
      required Map<String, String> headers,
      required String filePath,
      String? deviceId,
      bool isDigioRequest = false,
      bool isContentTypeJson = false}) {
    // TODO: implement postMultipart
    throw UnimplementedError();
  }

  // put method for API
  @override
  Future<HttpResponse> put(
      {required String url,
      required Map<String, dynamic> body,
      required Map<String, String> headers,
      bool isContentTypeJson = false}) async {
    HttpResponse httpResponse;

    try {
      // log('HttpClient PUT');
      // log('${Uri.parse(url)}');
      // log(json.encode(body));

      var request = http.put(
        Uri.parse(url),
        headers: await getHeader(
          headers,
          url,
          isContentTypeJson: isContentTypeJson,
        ),
        body: json.encode(body),
      );

      Response response = await request;
      httpResponse = await responseHandler(response, request: request);
    } catch (e) {
      // debugPrint("Exception IN  POST Request ${e.toString()}");
      if (e is UnauthorisedException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is BadRequestException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is NotFoundException) {
        httpResponse = HttpResponse(
          data: null,
          statuscode: e.statusCode,
          message: e.message,
          responseHeaders: {},
        );
      } else if (e is RetryException) {
        return put(
          url: url,
          body: body,
          isContentTypeJson: isContentTypeJson,
          headers: headers,
        );
      } else {
        httpResponse = HttpResponse(
          data: null,
          statuscode: 0,
          message: e.toString(),
          responseHeaders: {},
        );
      }
    } finally {
      //client.close();
    }
    return httpResponse;
  }

  Future<Map<String, String>> getHeader(
      Map<String, String>? header, String? url,
      {String? deviceId, bool isContentTypeJson = false}) async {
    header ??= {};
    String token = "";

    // _appPreferences.

    String custId = "";

    // if (appPreferences.readBool(key: SharedPreferenceKeys.isSocialLogin)) {
    // token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
    //   custId = FirebaseAuth.instance.currentUser?.displayName ?? '';
    // } else if (!appPreferences.readBool(
    //     key: SharedPreferenceKeys.isSocialLogin)) {
    //   custId = appPreferences.read(key: SharedPreferenceKeys.customerId);
    //   token = appPreferences.read(key: SharedPreferenceKeys.loginAccesToken);
    // }
    if (url != null) {
      // var deciveInfo = di.sl<DeviceInfoProvider>();
      // header["deviceId"] = deviceId ?? await getDeviceID(deciveInfo) ?? "";
      // header["ipAddress"] = await deciveInfo.getDeviceIp() ?? "192.168.10.101";

      // header["ipAddress"] = "192.168.10.101";
    }
    // log('Authorization');
    // log('Bearer $token');
    if (token.isNotEmpty) {
      header["Authorization"] = "Bearer $token";
    }

    /// used for saving api logs in firebase, un-comment when required.
    // saveLogInFirebase(url: url, custId: custId);

    // X-Frame options Header is a security header to avoid UI redressing attack such as Clickjacking
    header['X-Frame-Options'] = 'DENY';
    header['X-XSS-Protection'] = '1; mode=block';
    header['X-Content-Type-Options'] = 'nosniff';
    header['Content-Security-Policy'] =
        "frame-ancestors 'self' https://*.ysil.in/;";
    header['Strict-Transport-Security'] =
        'max-age=31536000; includeSubDomains; preload';
    header['Access-Control-Allow-Methods'] = "PUT, GET, POST, DELETE";

    if (isContentTypeJson) {
      header['Content-Type'] = "application/json";
    }

    return header;
  }

  Future<HttpResponse> responseHandler(
    http.Response response, {
    bool isDigioRequest = false,
    bool isJsonDecodeRequire = true,
    bool isReportDownload = false,
    required Future<Response> request,
    bool messageVisibility =
        true, // this variable is used for hiding toast message when checking device list from splash screen.
  }) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        HttpResponse httpResponse;

        var data = jsonDecode(utf8.decode(response.bodyBytes));

        if (data is List) {
          httpResponse = HttpResponse(
            data: data,
            statuscode: response.statusCode,
            responseHeaders: response.headers,
            message: '',
          );
        } else if (data is String) {
          httpResponse = HttpResponse(
            data: data,
            statuscode: response.statusCode,
            responseHeaders: response.headers,
            message: '',
          );
        } else {
          httpResponse = HttpResponse(
            data: data['data'] ?? data,
            statuscode: response.statusCode,
            responseHeaders: response.headers,
            message: data['message'] ?? data['errorMessage'] ?? '',
          );
        }

        return httpResponse;
      case 400:
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        bool blocked = false;
        bool passwordExpired = false;

        String message = data['message'] ?? 'Oops! Something went wrong';
        try {
          message = data['errors'][0];
        } catch (e) {
          print(e);
        }

        if (response.headers.containsKey("passwordexpired")) {
          try {
            passwordExpired = response.headers["passwordexpired"] == "true";

            if (passwordExpired) {
              // handle here what to do if password is expired.
            }
          } catch (e) {}
        }

        throw BadRequestException(
          statusCode: response.statusCode,
          message: message,
        );
      case 401:
        throw UnauthorisedException(
          statusCode: response.statusCode,
          //message: 'Unauthorized',
          message: 'Unauthorized.. => ${response.request?.url.toString()}',
        );

      case 404:
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        String message = data['message'] ?? '';
        if (data['data'] != null &&
            data['data'] is List &&
            data['data'].isNotEmpty) {
          try {
            List<String> keyList =
                (data['data'] as List<dynamic>)[0].keys.toList();
            int length = 0;
            for (int i = 0; i < keyList.length; i++) {
              if ("${(data['data'] as List<dynamic>)[0][keyList[i]]}".length >
                  length) {
                length =
                    "${(data['data'] as List<dynamic>)[0][keyList[i]]}".length;
                message = "${(data['data'] as List<dynamic>)[0][keyList[i]]}";
              }
            }
          } catch (e) {
            print(e.toString());
          }
        }
        // HttpResponse httpResponse = HttpResponse(
        //     data: data['data'] ?? data,
        //     statuscode: response.statusCode,
        //     responseHeaders: response.headers,
        //     message: message);
        var exception = NotFoundException(
          statusCode: response.statusCode,
          message: message,
          responseHeaders: response.headers,
          body: response.body,
        );
        throw exception;
      case 500:
      default:
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        String message = data['message'] ?? '';
        try {
          List<String> keyList =
              (data['data'] as List<dynamic>)[0].keys.toList();
          int length = 0;
          for (int i = 0; i < keyList.length; i++) {
            if ("${(data['data'] as List<dynamic>)[0][keyList[i]]}".length >
                length) {
              length =
                  "${(data['data'] as List<dynamic>)[0][keyList[i]]}".length;
              message = "${(data['data'] as List<dynamic>)[0][keyList[i]]}";
            }
          }
        } catch (e) {
          print(e.toString());
        }
        // HttpResponse httpResponse = HttpResponse(
        //     data: data['data'] ?? data,
        //     statuscode: response.statusCode,
        //     responseHeaders: response.headers,
        //     message: message);
        var exception = NotFoundException(
          statusCode: response.statusCode,
          message: message,
          responseHeaders: response.headers,
          body: response.body,
        );
        throw exception;
    }
  }
}
