import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:loanhive/services/secure_storage.dart';

class DioClient {
  late final Dio _dio;
  final env = DotEnv(includePlatformEnvironment: true)..load();

  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  // private constructor
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '$env["API-KEY"]',
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
        validateStatus: (status) => status! < 500,
      ),
    )..interceptors.addAll([
        AuthInterceptor(),
      ]);
  }

  Dio get client => _dio;
}


class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options); // ? meaning
  }
}
