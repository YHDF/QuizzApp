library globals;

import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/entities/user.dart';


class GlobalVariables{
  static List<QueryDocumentSnapshot<TriviaUser>>? usersList = <QueryDocumentSnapshot<TriviaUser>>[];

}