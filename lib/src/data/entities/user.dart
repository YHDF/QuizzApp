class TriviaUser {
  TriviaUser({
    int? id,
    int? score,
    String? email,
    String? pseudo,
    String? avatar,
    int? games,
    String? gameDate,

  }) {
    _email = email;
    _id = id;
    _score = score;
    _pseudo = pseudo;
    _avatar = avatar;
    _games = games;
    _gameDate = gameDate;
  }

  TriviaUser.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _score = json['score'];
    _pseudo = json['pseudo'];
    _avatar = json['avatar'];
    _games = json['games'];
    _gameDate = json['gameDate'];
  }

  int? _id;
  String? _email;
  int? _score;
  String? _pseudo;
  String? _avatar;
  int? _games;
  String? _gameDate;

  int? get id => _id;

  int? get score => _score;

  String? get pseudo => _pseudo;

  String? get email => _email;

  String? get avatar => _avatar;

  int? get games => _games;

  String? get gameDate => _gameDate;


  set setId(int id) {
    _id = id;
  }

  set setEmail(String email) {
    _email = email;
  }

  set setPseudo(String pseudo) {
    _pseudo = pseudo;
  }

  set setScore(int score) {
    _score = score;
  }

  set setAvatar(String avatar) {
    _avatar = avatar;
  }

  set setGames(int games) {
    _games = games;
  }

  set setGameDate(String gameDate) {
    _gameDate = gameDate;
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['score'] = _score;
    map['pseudo'] = _pseudo;
    map['avatar'] = _avatar;
    map['games'] = _games;
    map['email'] = _email;
    map['gameDate'] = _gameDate;
    return map;
  }
}