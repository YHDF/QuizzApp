import 'dart:async';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import '../../entities/user.dart';

class UserFireBase{
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  static UserFireBase? _instance;

  static late final CollectionReference<TriviaUser> _userRef;

  UserFireBase._();

  static UserFireBase getInstance(){
    if(_instance == null){
      _userRef = _firebaseFirestore.collection('users').withConverter<TriviaUser>(
          fromFirestore: (snapshot, _) => TriviaUser.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
      );
      _instance = UserFireBase._();
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



  Future<QuerySnapshot<TriviaUser>> searchUsersWithpseudo(String pseudo) async{
    return _userRef.where('pseudo', isEqualTo: pseudo).get();
  }

  Future<QuerySnapshot<TriviaUser>> searchUsersWithEmail(String email) async{
    return _userRef.where('email', isEqualTo: email).get();
  }

  String? getUserUID() {
    return (_fireBaseAuth.currentUser)?.uid;
  }


  Future<TriviaUser?> getUserById(String id) async{
    var document =  await _userRef.doc(id).get();
    return document.data();
  }

  Future<void> deleteUser(String id) async {
    return _userRef.doc(id).delete();
  }
  Future<UploadTask?> uploadFile(XFile file, String? userId) async {
    UploadTask uploadTask;
    final uid = _fireBaseAuth.currentUser?.uid;

    Reference ref = _firebaseStorage.ref().child('avatars').child('/$uid.jpg');

    final metadata = SettableMetadata(contentType: 'image/jpeg');

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
    return Future.value(uploadTask);
  }

  Future<String?> fetchImg() async {
    var downloadURL = await _firebaseStorage
        .ref()
        .child("avatars").child(getUserUID()! + '.jpg')
        .getDownloadURL();

    return downloadURL.toString();
  }
}

