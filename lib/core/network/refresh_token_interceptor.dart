import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'dart:io';

import 'package:riverpod_architecture/core/enums/index.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  late int retryCount = 0;

  RefreshTokenInterceptor({
    required this.dio,
  });

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    final box = Hive.box(HiveEnums.sessionBox.value);

    // print('asda ${err.response} ${err.response!.statusCode}');

    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return handler.next(DeadlineExceededException(err.requestOptions));
      case DioExceptionType.unknown:
        return handler.next(NoInternetConnectionException(err.requestOptions));

      default:
    }

    if (err.response == null) {
      print('asdas');
      return;
    }

    if (err.response!.statusCode == HttpStatus.internalServerError) {
      return handler.next(InternalServerErrorException(err.requestOptions));
    }

    if (retryCount >= 1) {
      err.requestOptions.cancelToken;
      await box.clear();

      return handler.next(err);
    }

    if (err.response!.statusCode == HttpStatus.unauthorized ||
        err.response!.statusCode == HttpStatus.forbidden) {
      final res = await refreshToken();

      retryCount++;

      if (res != null && res) {
        final resRetry = await _retry(err.requestOptions);
        if (resRetry == null) {
          return handler.next(err);
        }
        return handler.resolve(resRetry);
      }
    }

    return handler.next(err);
  }

  Future<bool?> refreshToken() async {
    final box = Hive.box(HiveEnums.sessionBox.value);
    final refreshToken = box.get(HiveEnums.refreshToken.value);

    try {
      final response = await dio.get(EndpointEnums.refresh.value,
          options: Options(headers: {'refresh_token': refreshToken}));
      box.put(HiveEnums.accessToken.value, response.data);

      return true;
    } catch (e) {
      await box.clear();
      return false;
    }
  }

  Future<Response?> _retry(RequestOptions requestOptions) async {
    final box = Hive.box(HiveEnums.sessionBox.value);
    final accessToken = box.get(HiveEnums.accessToken.value);

    requestOptions.headers.clear();
    requestOptions.headers.addAll({'Authorization': 'Bearer $accessToken'});

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    try {
      final r = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );

      return r;
    } catch (e) {
      return null;
    }
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
