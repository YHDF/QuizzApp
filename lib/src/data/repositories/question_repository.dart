import 'package:quizz_game/src/data/DataSource/remote/question_firebase.dart';
import 'package:quizz_game/src/data/entities/questionOfTheDay.dart';

class QuestionRepository {

  static QuestionRepository? _instance;
  static final QuestionFireBase _questionFireBase = QuestionFireBase.getInstance();

  static QuestionRepository getInstance(){
    _instance ??= QuestionRepository._();
    return _instance;
  }

  QuestionRepository._();

  Future<QuestionOfTheDay?> getQuestions(String id) async{
    QuestionOfTheDay? questionOfTheDay = await _questionFireBase.getQuestions();
    return questionOfTheDay;
  }

  Future<void> insertQuestions(QuestionOfTheDay questionOfTheDay) async{
    return _questionFireBase.insertQuestions(questionOfTheDay);
  }

  Future<void> deleteQuestions(String id) async {
    return _questionFireBase.deleteQuestions(id);
  }
}