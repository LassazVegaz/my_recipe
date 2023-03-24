import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_recipe/enums/role_enum.dart';

final _fa = FirebaseAuth.instance;
final _ff = FirebaseFirestore.instance;

class AuthRrepository {
  AuthRrepository._();
  static final AuthRrepository _instance = AuthRrepository._();
  static AuthRrepository get instance => _instance;

  Role? _role; // null if not logged in
  Role? get role => _role;

  User? get currentUser => _fa.currentUser;

  Future<User?> signIn(String email, String password) async {
    final userCredential = await _fa.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await setRole();

    return userCredential.user;
  }

  /// Set role automatically depending on signed in user
  Future<void> setRole() async => _role = await _getRole();

  // find user in collections users and chefs and return role accordingly
  // if email address is admin@admin.com then return admin
  Future<Role> _getRole() async {
    if (currentUser == null) throw Exception('Not logged in');

    if (currentUser!.email == 'admin@admin.com') return Role.admin;

    final user = await _ff.collection('users').doc(currentUser!.uid).get();
    if (user.exists) return Role.user;

    final chef = await _ff.collection('chefs').doc(currentUser!.uid).get();
    if (chef.exists) return Role.chef;

    throw Exception('User not found');
  }

  Future<void> signOut() async {
    await _fa.signOut();
    _role = null;
  }
}
