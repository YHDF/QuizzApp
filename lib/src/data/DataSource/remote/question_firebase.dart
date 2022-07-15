import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/src/data/entities/question.dart';
import 'package:quizz_game/src/data/entities/question_of_the_day.dart';

import '../../entities/question_of_the_day.dart';

class QuestionFireBase{
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static QuestionFireBase? _instance;

  static late final CollectionReference<QuestionOfTheDay> _questionRef;

  QuestionFireBase._();

  static QuestionFireBase getInstance(){
    if(_instance == null){
      _questionRef = _firebaseFirestore.collection('questionsOfTheDay').withConverter<QuestionOfTheDay>(
          fromFirestore: (snapshot, _) => QuestionOfTheDay.fromJson(snapshot.data()!),
          toFirestore: (questionOfTheDay, _) => questionOfTheDay.toJson(),
      );
      _instance = QuestionFireBase._();
    }
    return _instance!;
  }

  Future<void> insertQuestions(QuestionOfTheDay questionOfTheDay) async{
    print(_instance);
    await _questionRef.add(questionOfTheDay);
    return;
  }

  Future<QuestionOfTheDay?> getQuestions() async{
    QuerySnapshot<QuestionOfTheDay?> querySnapshot =  await _questionRef.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return !allData.isEmpty ? allData[allData.length-1 ] : null;
  }

  Future<String> getFirstId() async {
    QuerySnapshot<QuestionOfTheDay> questions = await _questionRef.get();
    return !questions.docs.isEmpty ?  questions.docs.first.id : "";
  }

  Future<void> deleteQuestions(String id) async {
    return _questionRef.doc(id).delete();
  }
}

