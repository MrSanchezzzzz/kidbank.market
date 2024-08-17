class UserState {
  final bool isLoading;
  final String? error;
  final bool success;

  UserState({
    required this.isLoading,
    this.error,
    required this.success,
  });
}
