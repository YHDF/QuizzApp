import 'package:quizz_game/src/data/DataSource/remote/question_api.dart';
import 'package:quizz_game/src/data/DataSource/remote/question_firebase.dart';
import 'package:quizz_game/src/data/entities/question_of_the_day.dart';

import '../entities/question.dart';

class QuestionRepository {

  static QuestionRepository? _instance;
  static final QuestionFireBase _questionFireBase = QuestionFireBase.getInstance();
  static final QuestionApi questionApi = QuestionApi.getInstance();

  static QuestionRepository? getInstance(){
    _instance ??= QuestionRepository._();
    return _instance;
  }

  QuestionRepository._();

  Future<List<Question>?> getFilteredQuestions() async {
    List<Question>? questions = await questionApi.getQuestionsOfTheDay();

    //QuestionOfTheDay listQuestionOfTheDay = await _questionFireBase.getQuestions();
    return questions;
    /*return <Question>[
      Question( "ekrhfekhf", <String>["a", "b", "c"], <String> ["x", "y", "z"] ),
    ];*/
  }

  Future<List<Question>?> getQuestions() async{
    List<Question>? list = await getFilteredQuestions();
    QuestionOfTheDay questionOfTheDay = QuestionOfTheDay(results: list, date: "8/2/2022", responseCode: 200);

    if(questionOfTheDay.date == _getdate()) {
      return questionOfTheDay.results;
    } else {
      List<Question>? questions = await getFilteredQuestions();
      QuestionOfTheDay questionOfTheDay = QuestionOfTheDay(results: questions, date: _getdate(), responseCode: 200);
      await insertQuestions(questionOfTheDay);
      await deleteQuestions();
      return questions!;
    }
  }

  Future<void> insertQuestions(QuestionOfTheDay questionOfTheDay) async{
    return _questionFireBase.insertQuestions(questionOfTheDay);
  }

  Future<void> deleteQuestions() async {
    String id = await _questionFireBase.getFirstId();
    return _questionFireBase.deleteQuestions(id);
  }

  String _getdate() {
    DateTime today = DateTime.now();
    return '${today.day}/${today.month}/${today.year}';
  }
}