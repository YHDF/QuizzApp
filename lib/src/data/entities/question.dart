class Question{

  String? _question;
  List<String>? _reponseIncorrectes;
  List<String>? _reponsesCorrectes;

  Question({
    String? question,
    List<String>? reponseIncorrectes,
    List<String>? reponsesCorrectes,
  });

  Question.fromJson(dynamic json) {
    _question = json['question'];
    _reponseIncorrectes = json['reponseIncorrectes'];
    _reponsesCorrectes = json['reponsesCorrectes'];
  }

  String? get question => _question;

  List<String>? get reponseIncorrectes => _reponseIncorrectes;

  List<String>? get reponsesCorrectes => _reponsesCorrectes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['reponseIncorrectes'] = _reponseIncorrectes;
    map['reponsesCorrectes'] = _reponsesCorrectes;
    return map;
  }


}