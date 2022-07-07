class Question{

   String? _question;
   String? _category;
   String? _difficulty;
   String? _type;
   List<dynamic>? _incorrectAnswers;
   String? _correctAnswer;

  Question(
    this._question, this._incorrectAnswers, this._correctAnswer, this._category, this._difficulty, this._type
  ) ;

  Question.fromJson(dynamic json) {
    _question = json['question'];
    _correctAnswer = json['correct_answer'];
    _incorrectAnswers = json['incorrect_answers'];
    _category = json['category'];
    _difficulty = json['difficulty'];
    _type = json['type'];
  }

  String? get question => _question;

  List<dynamic>? get incorrectAnswers => _incorrectAnswers;

  String? get correctAnswer => _correctAnswer;

   String? get category => _category;

   String? get difficulty => _difficulty;

   String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['correct_answer'] = _correctAnswer;
    map['incorrect_answers'] = _incorrectAnswers;
    map['category'] = _category;
    map['difficulty'] = _difficulty;
    map['type']= _type;
    return map;
  }


}