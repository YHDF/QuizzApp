import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizz_game/src/data/DataSource/remote/user_firebase.dart';
import 'package:quizz_game/src/data/entities/user.dart';

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
    return _userFireBase.insertUser(user);
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
}

