
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/sign_up_state.dart';
import '../presentation/screens/sign_up_controller.dart';

final signUpControllerProvider = StateNotifierProvider<SignUpController, SignUpState>(
      (ref) => SignUpController(),
);
