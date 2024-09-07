import 'package:dio/dio.dart';
import 'package:test_app/core/config/constants/paths.dart';
import 'package:test_app/features/auth/model/code_response.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository({required this.dio});

  Future<CodeResponse?> login(
      {required userName, required String password}) async {
    try {
      final formData = FormData.fromMap({
        'username': userName,
        'password': password,
      });

      final response = await dio.get(
        loginPath,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final codeResponse = CodeResponse.fromJson(response.data);

        return codeResponse;
      }

      throw Exception();
    } catch (e) {
      return null;
    }
  }
}
