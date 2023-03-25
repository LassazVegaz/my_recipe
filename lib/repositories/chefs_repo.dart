import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/repositories/auth_repo.dart';

final _fa = FirebaseAuth.instance;
final _ff = FirebaseFirestore.instance;
final _fs = FirebaseStorage.instance;
final _authRepo = AuthRrepository.instance;

const _colName = 'chefs';
const _foodTypesColName = 'food_types';

class ChefsRepository {
  // singleton
  ChefsRepository._();
  static final ChefsRepository instance = ChefsRepository._();

  Future<Chef> createChef(Chef chef, String password) async {
    var fUser = await _fa.createUserWithEmailAndPassword(
      email: chef.email,
      password: password,
    );

    var map = chef.toJson();
    await _ff.collection(_colName).doc(fUser.user!.uid).set(map);

    chef.id = fUser.user!.uid;
    if (chef.image != null) {
      chef.image = await uploadProfilePicture(chef.id!, chef.image!);
    }

    await _authRepo.setRole();

    return chef;
  }

  Future<Chef?> getChef(String id) async {
    var doc = await _ff.collection(_colName).doc(id).get();

    if (!doc.exists) return null;

    var chef = Chef.fromJson(doc.data()!);
    chef.id = doc.id;
    return chef;
  }

  Future<void> updateChef(Chef chef) async {
    var map = chef.toJson();
    await _ff.collection(_colName).doc(chef.id).update(map);
  }

  Future<void> deleteChef(String id) async {
    await _ff.collection(_colName).doc(id).delete();
  }

  Future<List<Chef>> getAllChefs() async {
    var docs = await _ff.collection(_colName).get();
    var chefs = docs.docs.map((e) {
      var chef = Chef.fromJson(e.data());
      chef.id = e.id;
      return chef;
    }).toList();
    return chefs;
  }

  Stream<List<Chef>> listenToChefs() async* {
    var docs = _ff.collection(_colName).snapshots();
    await for (var doc in docs) {
      var chefs = doc.docs.map((e) {
        var chef = Chef.fromJson(e.data());
        chef.id = e.id;
        return chef;
      }).toList();
      yield chefs;
    }
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

  Future<List<String>> getFoodTypes() async {
    var docs = await _ff.collection(_foodTypesColName).get();
    var foodTypes = docs.docs.map((e) => e.data()["name"] as String).toList();
    return foodTypes;
  }
}
