import 'dart:async';
import 'dart:developer';
import 'package:flutter_clean_todo/core/constants/storage_key.dart';
import 'package:flutter_clean_todo/core/services/storage_services/storage_services.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  final StorageService storageService;

  ApiServices({required this.dio, required this.storageService});

  Future<Response?> getWithoutToken({required String endPoint}) async {
    try {
      final response = await dio.get(endPoint);

      return response;
    } catch (e) {
      log(e.toString(), name: "GET_Without_Token REQUEST ERROR");
      rethrow;
    }
  }

  Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isCustomUrl = false,
    String? customUrl,
  }) async {
    final url = isCustomUrl ? customUrl! : endPoint;

    var token = storageService.getString(StorageKey.token);
    queryParameters?.removeWhere((key, value) => value == null || value == '' || value == "");
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "accept": "text/plain",
            "content-type": "application/json",
            "authorization": "Bearer $token",
          },
        ),
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      log(e.toString(), name: "GET REQUEST ERROR");
      rethrow;
    }
  }

  Future<Response?> post({
    required String endPoint,
    Object? reqData,
    Map<String, dynamic>? extraHeaders,
  }) async {
    var token = storageService.getString(StorageKey.token);
    try {
      final Map<String, dynamic> headers = {
        "accept": "text/plain",
        "content-type": "application/json",
        "authorization": "Bearer $token",
      };
      if (extraHeaders != null) {
        headers.addAll(extraHeaders);
      }
      final response = await dio.post(
        endPoint,
        data: reqData,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } catch (e) {
      log(e.toString(), name: "POST REQUEST ERROR");
      rethrow;
    }
  }

  Future<Response?> postWithoutToken({
    required String endPoint,
    Object? reqData,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        data: reqData,
        options: Options(
          headers: {
            "accept": "text/plain",
            "content-type": "application/json",
          },
        ),
      );
      return response;
    } catch (e) {
      log(e.toString(), name: "POST_Without_Token  REQUEST ERROR");
      rethrow;
    }
  }

  Future<Response?> put({
    required String endPoint,
    Object? reqData,
    Map<String, dynamic>? extraHeaders,
  }) async {
    var token = storageService.getString(StorageKey.token);
    final Map<String, dynamic> headers = {
      "accept": "text/plain",
      "content-type": "application/json",
      "authorization": "Bearer $token",
    };

    if (extraHeaders != null) {
      // Filter out null values from queryParameters
      extraHeaders.removeWhere((key, value) => value == null || value == '' || value == "");
      headers.addAll(extraHeaders);
    }
    try {
      final response = await dio.put(
        endPoint,
        data: reqData,
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } catch (e) {
      log(e.toString(), name: "PUT REQUEST ERROR");
      rethrow;
    }
  }

  Future<Response?> delete({
    required String endPoint,
    Object? reqData,
    Map<String, dynamic>? queryParameters,
  }) async {
    var token = storageService.getString(StorageKey.token);

    try {
      final response = await dio.delete(
        endPoint,
        data: reqData,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "accept": "text/plain; x-api-version=1.0",
            "content-type": "application/json",
            "authorization": "Bearer $token",
          },
        ),
      );

      return response;
    } catch (e) {
      log(e.toString(), name: "DELETE REQUEST ERROR");
      rethrow;
    }
  }
}
