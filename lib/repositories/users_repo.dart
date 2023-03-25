import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/repositories/auth_repo.dart';

final _fa = FirebaseAuth.instance;
final _ff = FirebaseFirestore.instance;
final _fs = FirebaseStorage.instance;
final _authRepo = AuthRrepository.instance;

const _colName = 'users';

class UsersRepository {
  // singleton
  UsersRepository._();
  static final UsersRepository instance = UsersRepository._();

  Future<NormalUser> createUser(NormalUser user, String password) async {
    var fUser = await _fa.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    var map = user.toJson();
    await _ff.collection(_colName).doc(fUser.user!.uid).set(map);

    user.id = fUser.user!.uid;
    if (user.image != null) {
      user.image = await uploadProfilePicture(user.id!, user.image!);
    }

    await _authRepo.setRole();

    return user;
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

  Future<String> uploadProfilePicture(String uid, String imgFile) async {
    var file = File(imgFile);
    var fileExt = file.path.split('.').last;

    var ref = _fs.ref().child('profile_pictures/$uid.$fileExt');
    await ref.putFile(file);

    var url = await ref.getDownloadURL();
    await _ff.collection(_colName).doc(uid).update({'image': url});

    return url;
  }

  Stream<List<NormalUser>> listenToUsers() async* {
    var docs = _ff.collection(_colName).snapshots();
    await for (var doc in docs) {
      var users = doc.docs.map((e) {
        var user = NormalUser.fromJson(e.data());
        user.id = e.id;
        return user;
      }).toList();
      yield users;
    }
  }
}
