import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/repositories/auth_repo.dart';

final _fa = FirebaseAuth.instance;
final _ff = FirebaseFirestore.instance;
final _authRepo = AuthRrepository.instance;

const _colName = 'chefs';

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

    await _authRepo.setRole();

    chef.id = fUser.user!.uid;
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
}
