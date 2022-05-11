abstract class AuthService<UserType> {
  Future<UserType?> signInWithEmailAndPassword(String email, String password);
  Future<UserType?> signInWithGoogle();
  Future<UserType?> createUserWithEmailAndPassword(
      String email, String password);
  Future<String?> getCurrentUserId();
  Future<void> signOut();
  UserType? get currentUser;
  Stream<UserType?> get onAuthStateChanged;
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
