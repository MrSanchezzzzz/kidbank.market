
class SignUpState {
  final bool isNameValid;
  final bool isEmailValid;
  final bool isCountryValid;
  final bool isPasswordValid;
  final bool doPasswordsMatch;

  const SignUpState({
    this.isNameValid = false,
    this.isEmailValid = false,
    this.isCountryValid = false,
    this.isPasswordValid = false,
    this.doPasswordsMatch = false,
  });

  SignUpState copyWith({
    bool? isNameValid,
    bool? isEmailValid,
    bool? isCountryValid,
    bool? isPasswordValid,
    bool? doPasswordsMatch,
  }) {
    return SignUpState(
      isNameValid: isNameValid ?? this.isNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isCountryValid: isCountryValid ?? this.isCountryValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      doPasswordsMatch: doPasswordsMatch ?? this.doPasswordsMatch,
    );
  }
}
