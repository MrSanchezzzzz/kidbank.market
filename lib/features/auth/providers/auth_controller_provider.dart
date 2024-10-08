
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/auth_state.dart';
import '../presentation/screens/auth_controller.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
      (ref) => AuthController()
);
