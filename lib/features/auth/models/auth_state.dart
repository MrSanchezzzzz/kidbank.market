
class AuthState{
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isLoading;

  const AuthState({
      this.isEmailValid=false,
      this.isPasswordValid=false,
      this.isLoading=false,
  });

  bool get isAllValid=>isEmailValid&&isPasswordValid;

  AuthState copyWith({bool? isEmailValid,bool? isPasswordValid, bool? loading,}){
    return AuthState(
      isEmailValid: isEmailValid??false,
      isPasswordValid: isPasswordValid??false,
      isLoading: loading??false
    );
  }
}