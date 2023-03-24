import 'package:firebase_auth/firebase_auth.dart';

final _fa = FirebaseAuth.instance;

class AuthRrepository {
  AuthRrepository._();
  static final AuthRrepository _instance = AuthRrepository._();
  static AuthRrepository get instance => _instance;

  User? get currentUser => _fa.currentUser;

  Future<User?> signIn(String email, String password) async {
    final userCredential = await _fa.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async => await _fa.signOut();
}
