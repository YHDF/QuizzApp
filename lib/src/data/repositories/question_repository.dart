import 'package:quizz_game/src/data/DataSource/remote/question_firebase.dart';
import 'package:quizz_game/src/data/entities/question_of_the_day.dart';

import '../entities/question.dart';

class QuestionRepository {

  static QuestionRepository? _instance;
  static final QuestionFireBase _questionFireBase = QuestionFireBase.getInstance();

  static QuestionRepository? getInstance(){
    _instance ??= QuestionRepository._();
    return _instance;
  }

  QuestionRepository._();

  Future<List<Question>?> getFilteredQuestions() async {
    QuestionOfTheDay listQuestionOfTheDay = await _questionFireBase.getQuestions();
    return listQuestionOfTheDay.results;
  }

  Future<List<Question>> getQuestions(String id) async{
    List<Question>? list = await getFilteredQuestions();
    QuestionOfTheDay questionOfTheDay = QuestionOfTheDay(results: list, date: _getdate());

    if(questionOfTheDay.date == _getdate()) {
      return questionOfTheDay.results!;
    } else {
      List<Question>? questions = await getFilteredQuestions();
      QuestionOfTheDay questionOfTheDay = QuestionOfTheDay(results: list, date: _getdate());

      deleteQuestions();
      insertQuestions(questionOfTheDay);
      return questions!;
    }
  }

  Future<void> insertQuestions(QuestionOfTheDay questionOfTheDay) async{
    return _questionFireBase.insertQuestions(questionOfTheDay);
  }

  Future<void> deleteQuestions() async {
    String id = _questionFireBase.getId();
    return _questionFireBase.deleteQuestions(id);
  }

  String _getdate() {
    DateTime today = DateTime.now();
    return '${today.day}/${today.month}/${today.year}';
  }
}