import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_recipe/models/user_model.dart';

final _fa = FirebaseAuth.instance;
final _ff = FirebaseFirestore.instance;

const _colName = 'users';

class UsersRepository {
  // singleton
  UsersRepository._();
  static final UsersRepository instance = UsersRepository._();

  Future<void> createUser(NormalUser user, String password) async {
    var fUser = await _fa.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );
    var map = user.toJson();
    await _ff.collection(_colName).doc(fUser.user!.uid).set(map);
  }

  Future<NormalUser?> getUser(String id) async {
    var doc = await _ff.collection(_colName).doc(id).get();

    if (!doc.exists) return null;

    var user = NormalUser.fromJson(doc.data()!);
    user.id = doc.id;
    return user;
  }

  Future<void> updateUser(NormalUser user) async {
    var map = user.toJson();
    await _ff.collection(_colName).doc(user.id).update(map);
  }

  Future<void> deleteUser(String id) async {
    await _ff.collection(_colName).doc(id).delete();
  }

  Future<List<NormalUser>> getAllUsers() async {
    var docs = await _ff.collection(_colName).get();
    var users = docs.docs.map((e) {
      var user = NormalUser.fromJson(e.data());
      user.id = e.id;
      return user;
    }).toList();
    return users;
  }
}
