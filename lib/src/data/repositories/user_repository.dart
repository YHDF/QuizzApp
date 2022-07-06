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
}