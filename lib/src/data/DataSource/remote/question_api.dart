import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:quizz_game/src/data/entities/question.dart';
import 'package:quizz_game/src/data/entities/question_of_the_day.dart';

class QuestionApi {
  final String _baseUrl = "opentdb.com";

  static QuestionApi? _instance;

  static getInstance() {
    _instance ??= QuestionApi._();
    return _instance!;
  }

  QuestionApi._();

  Future<List<Question>> getQuestionsOfTheDay() async {
    final queryParameters = {'amount' : '5' };
    final url = Uri.http(_baseUrl, 'api.php', queryParameters);

    final response = await http.get(url);
    if(response.statusCode == 200) {
      QuestionOfTheDay questionOfTheDay = QuestionOfTheDay.fromJson(jsonDecode(response.body));
      return questionOfTheDay.results!;
    } else {
      throw Exception("Failed to load questions");
    }
  }
}