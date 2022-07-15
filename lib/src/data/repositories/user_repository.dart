import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizz_game/src/data/DataSource/remote/user_firebase.dart';
import 'package:quizz_game/src/data/entities/user.dart';
import 'package:crypto/crypto.dart';

class UserRepository {

  static UserRepository? _instance;
  static final UserFireBase _userFireBase = UserFireBase.getInstance();


  static UserRepository? getInstance(){
    _instance ??= UserRepository._();
    return _instance;
  }

  UserRepository._();

  Future<TriviaUser?> getUserById(String id) async{
    TriviaUser? user = await _userFireBase.getUserById(id);
    return user;
  }

  Future<void> createUser(TriviaUser user) async{
    String digestedString =  encryptEmail(user.email!);
    return _userFireBase.insertUser(user, digestedString.toString());
  }

  String encryptEmail(String email){
    var bytes1 = utf8.encode(email);         // data being hashed
    var digest1 = sha256.convert(bytes1);
    return digest1.toString();
  }

  Future<String?> uploadAvatar(XFile file, String? userId) async{
    String? downloadURL = await _userFireBase.uploadFile(file, userId);
    return downloadURL;
  }

  Future<String?> fetchAvatar() async {
    String? avatarURL = await _userFireBase.fetchImg();
    return avatarURL;
  }

  Future<TriviaUser> getUserByEmail(String? email) async{
    QuerySnapshot<TriviaUser> querySnapshot = await _userFireBase.searchUsersWithEmail(email!);
    return querySnapshot.docs.first.data();
  }

  Future<void> updateScoreAndGameDate(String email, String score) async{
    String docId = encryptEmail(email);
    TriviaUser? triviaUser = await _userFireBase.getUserById(docId);
    triviaUser?.setGameDate = _getdate();
    triviaUser?.setScore = int.parse(score);
    _userFireBase.updateUser(triviaUser!, encryptEmail(email));
  }

  String _getdate() {
    DateTime today = DateTime.now();
    return '${today.day}/${today.month}/${today.year}';
  }

  Future<bool> checkGameDate(String email) async{
    String docId = encryptEmail(email);
    TriviaUser? triviaUser = await _userFireBase.getUserById(docId);
    if(triviaUser?.gameDate == _getdate()){
      return true;
    }
    return false;
  }

  Future<List<QueryDocumentSnapshot<TriviaUser>>> getAllUser() async{
    QuerySnapshot<TriviaUser> triviaUsers = await _userFireBase.getAll();
    return triviaUsers.docs;
  }

}

