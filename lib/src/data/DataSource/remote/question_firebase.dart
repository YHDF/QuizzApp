import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_game/src/data/entities/question_of_the_day.dart';

import '../../entities/question_of_the_day.dart';

class QuestionFireBase{
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static QuestionFireBase? _instance;

  static late final CollectionReference<QuestionOfTheDay> _questionRef;

  QuestionFireBase._();

  static QuestionFireBase getInstance(){
    if(_instance == null){
      _questionRef = _firebaseFirestore.collection('questionOfTheDay').withConverter<QuestionOfTheDay>(
          fromFirestore: (snapshot, _) => QuestionOfTheDay.fromJson(snapshot.data()!),
          toFirestore: (questionOfTheDay, _) => questionOfTheDay.toJson(),
      );
      _instance = QuestionFireBase._();
    }
    return _instance!;
  }

  Future<void> insertQuestions(QuestionOfTheDay questionOfTheDay) async{
    await _questionRef.add(questionOfTheDay);
    return;
  }

  Future<QuestionOfTheDay?> getQuestions() async{
    var document =  await _questionRef.doc().get();
    return document.data();
  }


  Future<void> deleteQuestions(String id) async {
    return _questionRef.doc(id).delete();
  }
}

