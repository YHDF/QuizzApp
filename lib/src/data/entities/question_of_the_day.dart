
import 'package:quizz_game/src/data/entities/question.dart';

class QuestionOfTheDay{
  int? responseCode;
  String date = '';
  List<dynamic>? results;

  QuestionOfTheDay({this.responseCode, this.results, required this.date});


  QuestionOfTheDay.fromJson(Map<String, dynamic> json){
    responseCode = json['response_code'];
    if(json['results'] != null){
      results = json['results'];
    }
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if(results != null){
      data['results'] = results!.map((e) => e.toJson()).toList();
    }
    return data;
  }



}