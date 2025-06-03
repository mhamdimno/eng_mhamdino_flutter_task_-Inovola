// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:shared/shared.dart';

import '../../api_service.dart';

@LazySingleton(as: ApiService)
class DioApiService implements ApiService {
  final Dio _dio;
  final TokenService? tokenService;
  DioApiService(this._dio, {this.tokenService}) {
    _dio.options
      ..connectTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..sendTimeout = const Duration(minutes: 1);

    _dio.options.validateStatus = _validateStatus;
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    _dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        client = httpClient;
        return client;
      };
  }

  @override
  Future<T> get<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return fromJson(response.data['data'] ?? {});
  }

  @override
  Future<T> getDynamicObject<T>(String path,
      {required JsonConverterDynamicResponse<T> fromJson,
      Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.data['key'] == "success") {
      return fromJson(response.data['data'] ?? {});
    } else {
      throw Exception(response.data['msg']);
    }
  }

  @override
  Future<String?> getString(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.data['key'] == "success") {
      return response.data;
    } else {
      throw Exception(response.data['msg']);
    }
  }

  @override
  Future<List<T>> getList<T>(String path,
      {required JsonConverterResponse<T> fromJson,
      Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    if (response.data['key'] == "success") {
      return (response.data['data'] as List<dynamic>)
          .map((e) => fromJson(e))
          .toList();
    } else {
      throw Exception(response.data['msg']);
    }
  }

  @override
  Future<List<T>> postList<T>(
    String path, {
    required JsonConverterResponse<T> fromJson,
    String? contentType = Constants.jsonType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  }) async {
    final response = await _dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
      options: options ?? Options(contentType: contentType),
    );
    if (response.data['key'] != "success") {
      throw Exception(response.data['msg']);
    } else {
      return (response.data['data'] as List<dynamic>)
          .map((e) => fromJson(e))
          .toList();
    }
  }

  @override
  Future<T> post<T>(String path,
      {dynamic data,
      required JsonConverterResponse<T> fromJson,
      String? contentType,
      bool withData = true}) async {
    final response = await _dio.post(path,
        data: data, options: Options(contentType: contentType));
    // if (withData) return fromJson(response.data['data']);
    if (response.data['key'] == "success") {
      return fromJson(response.data['data']);
    } else {
      throw Exception(response.data['msg']);
    }
  }

  @override
  Future<T> put<T>(String path,
      {dynamic data, required JsonConverterResponse<T> fromJson}) async {
    final response = await _dio.put(path, data: data);
    if (response.data['key'] == "success") {
      return fromJson(response.data['data']);
    } else {
      throw Exception(response.data['msg']);
    }
  }

  @override
  Future<T> delete<T>(String path,
      {required JsonConverterResponse<T> fromJson}) async {
    final response = await _dio.delete(path);
    if (response.data['key'] == "success") {
      return fromJson(response.data['data']);
    } else {
      throw Exception(response.data['msg']);
    }
  }

  // @override
  // Future<T> upload<T>(
  //   String path, {
  //   required JsonConverterResponse<T> fromJson,
  //   required String filePath,
  //   String filename = "image",
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? additionalData,
  //   Options? options,
  // }) async {
  //   // Create FormData instance
  //   FormData formData = FormData.fromMap({
  //     filename: await MultipartFile.fromFile(
  //       filePath,
  //     ),
  //     ...?additionalData, // Add any additional form data if provided
  //   });

  //   // Make the POST request with FormData
  //   final response = await _dio.post(
  //     path,
  //     data: formData,
  //     queryParameters: queryParameters,
  //     options: options ??
  //         Options(
  //           contentType: contentType,
  //           headers: {
  //             'Content-Type':
  //                 'multipart/form-data', // Ensure the content type is set correctly
  //           },
  //         ),
  //   );

  //   // Convert the response to the desired type
  //   return fromJson(response.data);
  // }

  bool _validateStatus(int? status) {
    if (status != null && status < 500) return true;
    return false;
  }

  @override
  Future<T> upload<T>(String path,
      {required JsonConverterDynamicResponse<T> fromJson,
      Map<String, dynamic>? data,
      required String filePath,
      String? fileName,
      Map<String, dynamic>? queryParameters}) async {
    data =
        data?.map((key, value) => MapEntry(key.toString(), value.toString()));
    data?.remove(fileName);
    data?.removeWhere((key, value) => value == null);
    debugPrint("👀data $data");

    final String finalUrl = "https://newplan.plusrow.net$path";
    final uri = Uri.parse(finalUrl);
    var request = http.MultipartRequest('POST', uri)
      ..files.add(
          await http.MultipartFile.fromPath(fileName ?? "image", filePath));
    request.headers['Authorization'] = 'Bearer ${tokenService?.getAuthToken}';
    data?.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();

    final responseMap = jsonDecode(responseBody) as Map<String, dynamic>;
    debugPrint("👀responseMap $responseMap");
    if (responseMap['status_code'] == 200) {
      return fromJson(responseMap['data']);
    } else {
      throw Exception(responseMap['msg']);
    }
    // } else {
    //   throw Exception(responseMap['msg']);
    //  }

    // Convert the response to the desired type
  }

  @override
  Future<String?> download(
    String path,
    String finalPath,
  ) async {
    await Dio().download(path, finalPath);
    return finalPath;
  }
}
