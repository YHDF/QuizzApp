import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/user.dart';

class UserFireBase{
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static UserFireBase? _instance;

  static late final CollectionReference<TriviaUser> _userRef;

  UserFireBase._();

  static UserFireBase getInstance(){
    if(_instance == null){
      _userRef = _firebaseFirestore.collection('users').withConverter<TriviaUser>(
          fromFirestore: (snapshot, _) => TriviaUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
          _instance = UserFireBase._();
      );
    }
    return _instance!;
  }

  Future<void> insertUser(TriviaUser user) async{
    await _userRef.add(user);
    return;
  }

  Future<void> insertUserWithId(TriviaUser user, String id) async{
    return _userRef.doc(id).set(user);
  }

  Future<void> updateUser(TriviaUser user, String id) async{
    _userRef.doc(id).update(user.toJson());
  }

  Future<QuerySnapshot<TriviaUser>> getAll() async{
    QuerySnapshot<TriviaUser> test = await _userRef.get();
    test.docs.forEach((element) { });
    return _userRef.get();
  }



  Future<QuerySnapshot<TriviaUser>> searchUsers(String pseudo) async{
    return _userRef.where('pseudo', isEqualTo: pseudo).get();
  }


  Future<TriviaUser?> getUserById(String id) async{
    var document =  await _userRef.doc(id).get();
    return document.data();
  }

  Future<void> deleteUser(String id) async {
    return _userRef.doc(id).delete();
  }
}

