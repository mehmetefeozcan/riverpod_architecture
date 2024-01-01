import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_architecture/core/enums/index.dart';

class AccessTokenInterceptor extends Interceptor {
  final Dio dio;

  AccessTokenInterceptor({
    required this.dio,
  });

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final box = Hive.box(HiveEnums.sessionBox.value);

    if (options.path == EndpointEnums.login.value ||
        options.path == EndpointEnums.register.value ||
        options.path == EndpointEnums.refresh.value) {
      return handler.next(options);
    }
    final accessToken = box.get(HiveEnums.accessToken.value);
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }
}
