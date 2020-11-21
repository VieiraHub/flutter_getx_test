import 'package:dio/dio.dart';
import 'package:getx_test/models/user.dart';

class UsersApi {
  // Singleton de usersApi
  UsersApi._internal();
  static UsersApi _instance = UsersApi._internal();
  static UsersApi get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
        'https://reqres.in/api/users',
        queryParameters: {
          "page": page,
          "delay": 2,
        }
      );

      return (response.data['data'] as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}