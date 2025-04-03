import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contentType,
    String? stripeVersion,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {"Authorization": "Bearer $token"},
      ),
    );
    return response;
  }
}
