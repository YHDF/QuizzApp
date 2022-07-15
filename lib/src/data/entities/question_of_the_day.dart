
import 'package:quizz_game/src/data/entities/question.dart';

class QuestionOfTheDay{
  int? responseCode;
  String? date;
  List<Question>? results;

  QuestionOfTheDay({this.responseCode, this.results, this.date});


  QuestionOfTheDay.fromJson(Map<String, dynamic> json){
    responseCode = json['response_code'];
    if(json['results'] != null){
      results = <Question>[];
      json['results'].forEach((v){
        results!.add(Question.fromJson(v));
      });
    }
    date = json['date'];
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if(results != null){
      data['results'] = results!.map((e) => e.toJson()).toList();
    }
    data['date'] = date;
    return data;
  }



}