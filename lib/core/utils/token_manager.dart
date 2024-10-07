import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const _storage = FlutterSecureStorage();
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  // Write token to secure storage
  static Future<void> _writeToken({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  // Read token from secure storage
  static Future<String> _readToken({required String key}) async {
    String? token = await _storage.read(key: key);
    if (token == null || token.isEmpty) {
      throw Exception('Token for key "$key" is empty or null.');
    }
    return token;
  }

  // Set both access and refresh tokens if provided
  static Future<void> setTokens({String? access, String? refresh}) async {
    if (access != null) {
      await setAccessToken(token: access);
    }
    if (refresh != null) {
      await setRefreshToken(token: refresh);
    }
  }

  // Set access token
  static Future<void> setAccessToken({required String token}) async {
    await _writeToken(key: _accessTokenKey, value: token);
  }

  // Set refresh token
  static Future<void> setRefreshToken({required String token}) async {
    await _writeToken(key: _refreshTokenKey, value: token);
  }

  // Get access token
  static Future<String> getAccessToken() async {
    try {
      return await _readToken(key: _accessTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  // Get refresh token
  static Future<String> getRefreshToken() async {
    try {
      return await _readToken(key: _refreshTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteAll() async{
    await _storage.deleteAll();
  }
}
