import 'dart:io';

import 'package:kidbank/core/utils/requests.dart';
import 'package:kidbank/core/utils/token_manager.dart';

class AuthManager {

  static void login({
    required String email,
    required String password,
    Function()? onSuccess,
    Function(int)? onError,
  }) {
    Requests.login(login: email, password: password)
        .then((val) {
      String accessToken = val['token'];
      String refreshToken = val['refreshToken'];
      TokenManager.setTokens(access: accessToken,refresh: refreshToken);

      onSuccess?.call();
    }).catchError((err) {
      HttpException ex=err as HttpException;
      onError?.call(int.parse(ex.message));
    });
  }

  static void register({
    required String name,
    required String email,
    required String password,
    String? surname,
    String? phone,
    String role = 'parent',
    Function()? onSuccess,
    Function(int)? onError,
  }) {
    Requests.register(
      name: name,
      surname: surname,
      email: email,
      phone: phone,
      password: password,
    ).then((val) {
      String accessToken = val['token'];
      String refreshToken = val['refreshToken'];
      TokenManager.setAccessToken(token: accessToken);
      TokenManager.setRefreshToken(token: refreshToken);

      // Call the onSuccess callback if provided
      onSuccess?.call();
    }).catchError((err) {
      HttpException ex=err as HttpException;
      onError?.call(int.parse(ex.message));
    });
  }
}
