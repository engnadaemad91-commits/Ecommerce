import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app_huma_volve/core/failure/error_handler.dart';

void main() {
  test('maps HTTP status codes to readable failures', () {
    final error = DioException(
      requestOptions: RequestOptions(path: '/products'),
      response: Response<void>(
        requestOptions: RequestOptions(path: '/products'),
        statusCode: 401,
      ),
    );

    expect(ErrorHandler.handle(error).failureMessage, 'Unauthorized');
  });

  test('maps Dio timeouts to deadline failures', () {
    final error = DioException(
      requestOptions: RequestOptions(path: '/products'),
      type: DioExceptionType.connectionTimeout,
    );

    expect(ErrorHandler.handle(error).failureMessage, 'Deadline');
  });
}
