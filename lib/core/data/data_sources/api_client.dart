import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/network_error_handler.dart';
import '../models/auth_response_model.dart';
import '../models/store_model.dart';
import '../models/stores_response_model.dart';

class ApiClient {
  static const String baseUrl = 'http://localhost:8000';
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          _clearToken();
        }
        handler.next(error);
      },
    ));
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> _setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<AuthResponseModel> login(String username, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      final authResponse = AuthResponseModel.fromJson(response.data);
      await _setToken(authResponse.accessToken);
      return authResponse;
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<StoresResponseModel> getStores({
    int page = 1,
    int limit = 10,
    String? search,
    String? city,
    String? sector,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (search != null) queryParams['search'] = search;
      if (city != null) queryParams['city'] = city;
      if (sector != null) queryParams['sector'] = sector;

      final response = await _dio.get('/stores/', queryParameters: queryParams);
      return StoresResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<StoreModel> getStore(String storeId) async {
    try {
      final response = await _dio.get('/stores/$storeId');
      return StoreModel.fromJson(response.data);
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<StoreModel> createStore(Map<String, dynamic> storeData) async {
    try {
      final response = await _dio.post('/stores/', data: storeData);
      return StoreModel.fromJson(response.data);
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<StoreModel> updateStore(String storeId, Map<String, dynamic> storeData) async {
    try {
      final response = await _dio.put('/stores/$storeId', data: storeData);
      return StoreModel.fromJson(response.data);
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<void> deleteStore(String storeId) async {
    try {
      await _dio.delete('/stores/$storeId');
    } catch (e) {
      throw Exception(NetworkErrorHandler.handleError(e));
    }
  }

  Future<bool> isAuthenticated() async {
    final token = await _getToken();
    return token != null;
  }

  Future<void> logout() async {
    await _clearToken();
  }
}
