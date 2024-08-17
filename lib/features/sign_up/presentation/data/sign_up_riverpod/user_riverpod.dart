import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/user_state.dart';
import 'package:http/http.dart' as http;

class UserRiverpodNotifier extends StateNotifier<UserState> {
  UserRiverpodNotifier()
      : super(UserState(isLoading: false, success: false, error: null));
}
class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(isLoading: false, success: false, error: null));

  Future<void> sendUserDetails(String name, String surname, String email, String phone) async {
    state = UserState(isLoading: true, success: false, error: null);

    try {
      final response = await http.post(
        ///TODO NEED URL
        Uri.parse(''),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'surname': surname,
          'email': email,
          'phone':phone,
         
        }),
      );

      if (response.statusCode == 200) {
        state = UserState(isLoading: false, success: true, error: null);
      } else {
        state = UserState(isLoading: false, success: false, error: 'Failed to send user details');
      }
    } catch (e) {
      state = UserState(isLoading: false, success: false, error: e.toString());
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});