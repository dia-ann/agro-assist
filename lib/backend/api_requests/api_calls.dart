import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GreenMindsCall {
  static Future<ApiCallResponse> call({
    double? lat = 28.67,
    double? lon = 77.22,
    String? apikey = 'cc85a1a8b767e08c49ebc5cc6b54bb7f',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'green minds',
      apiUrl:
          'https://api.openweathermap.org/data/3.0/onecall?lat=${lat}&lon=${lon}&appid=${apikey}&units=metric',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? currenttemp(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.current.temp''',
      ));
  static String? currentweatherdescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.weather[:].description''',
      ));
  static String? currentweathericon(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.weather[:].icon''',
      ));
  static String? currentweathermain(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.weather[:].main''',
      ));
  static List<int>? dailydatetime(dynamic response) => (getJsonField(
        response,
        r'''$.daily[:].dt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<double>? dailytempmin(dynamic response) => (getJsonField(
        response,
        r'''$.daily[:].temp.min''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? dailytempmax(dynamic response) => (getJsonField(
        response,
        r'''$.daily[:].temp.max''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyweathermain(dynamic response) => (getJsonField(
        response,
        r'''$.daily[:].weather[:].main''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyweatherdescription(dynamic response) =>
      (getJsonField(
        response,
        r'''$.daily[:].weather[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyweathericon(dynamic response) => (getJsonField(
        response,
        r'''$.daily[:].weather[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? dailyweather(dynamic response) => getJsonField(
        response,
        r'''$.daily''',
        true,
      ) as List?;
  static int? currenthumidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current.humidity''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
