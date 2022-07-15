
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_game/src/data/entities/question.dart';
import 'package:quizz_game/src/presentation/Pages/Score/score.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_cubit.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_state.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/question_repository.dart';
import '../../../data/repositories/user_repository.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePagePageState createState() => _GamePagePageState();
}

class _GamePagePageState extends State<GamePage> {

  final UserRepository? userRepository = UserRepository.getInstance();

  final AuthRepository? authRepository = AuthRepository.getInstance();


  GameCubit? cubit;

  String? text;

  List<Question> stateDataHolder = <Question>[];

  List<String?> questions = <String>[];

  List<String>? possibleAnswers = <String>[];

  List<String?> dificulties = <String>[];

  List<int> numberOfAnswers = <int>[];

  int scores = 0;


  int noteDificulty(String difficultyString){
    if(difficultyString.contains('easy')){
      return 1;
    }
    if(difficultyString.contains('medium')){
      return 2;
    }
    if(difficultyString.contains('hard')){
      return 3;
    }
    return 0;
  }

  void onPressed(int answerChosen) {

    setState(() {
      if(possibleAnswers![numberOfAnswers[0] - 1] == possibleAnswers![answerChosen]){
        scores += noteDificulty(dificulties[0]!);
      }

      questions.removeAt(0);
      possibleAnswers!.removeRange(0, numberOfAnswers[0]);
      numberOfAnswers.removeAt(0);
      dificulties.removeAt(0);

      if(questions.isEmpty){
        //await userRepository?.updateUser();
        String? email = authRepository?.getUser();
        userRepository?.updateScoreAndGameDate(email!, scores.toString());


        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScorePage(scores.toString())));
      }
    });
  }

  void initList(List<Question> questionsList){
//    questionsList.forEach((element) {print(element.difficulty);});
    questionsList.forEach((element) {
      questions.add(element.question);
      element.incorrectAnswers?.forEach((element) {
        possibleAnswers?.add(element);
      });
      possibleAnswers!.add(element.correctAnswer!);
      dificulties.add(element.difficulty);
      numberOfAnswers.add(element.incorrectAnswers!.length + 1);

    });
  }

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quizz", style:  TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: RepositoryProvider(
        create: (context) => QuestionRepository.getInstance(),
        child: BlocProvider(
          create: (context) {
            cubit = GameCubit(
                questionRepository:
                    RepositoryProvider.of<QuestionRepository>(context));
            return cubit!..fetchWord();
          },
          child: BlocConsumer<GameCubit, GameState>(
            listener: (context, state) {
              if (state is Loaded) {
                setState(() {
                  initList(state.questions);
                  stateDataHolder = List.of(state.questions);
                });
              }
            },
            builder: (context, state) {
              return SizedBox(
                width: dev_width,
                height: dev_height,
                child: Column(
                  children: [
                    Container(
                      width: dev_width,
                      height: dev_height -  AppBar().preferredSize.height - 50,
                      color: Colors.blueAccent,
                      child: Stack(
                        children: createCards(context, state),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> createCards(BuildContext context, GameState state) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;

    if (state is Loaded) {
      final cards = List<Widget>.generate(questions.length, (int index) {

        return Align(
          alignment: Alignment(0, 0),
          child: Container(
            width: 0.9 * dev_width,
            height: 3 * dev_height / 4.5 ,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Divider(height: 25,color: Colors.transparent,),
                SizedBox(
                  child: Center(
                      child: Text(
                    questions[questions.length - 1 - index] ?? "No Question Fuck OFF",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(
                  child: Column(children: [
                    Divider(height: 25,color: Colors.transparent,),
                    Column(
                      children: generateAnswers(context, state, questions.length - 1 - index),
                    ),
                    Divider(height: 25,color: Colors.transparent,),

                    Column(
                      children: generateAnswerButtons(context, state, questions.length - 1 - index),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      });
      return cards;
    } else {
      return <Widget>[];
    }
  }

  List<Widget> generateAnswers(
      BuildContext context, GameState state, int questionNumber) {


    if (state is Loaded) {
      /*if(questionnumber != 0)
        answers.removeAt(answers.length - 1);*/
      List<Widget> answersWidgets =
          List<Widget>.generate(numberOfAnswers[questionNumber], (index) {
        return Text(
          (index + 1).toString() + ": " + possibleAnswers![index] ,
          style: const TextStyle(color: Colors.white),
        );
      });
      return answersWidgets;
    } else {
      return <Card>[];
    }
  }

  List<Widget> generateAnswerButtons(
      BuildContext context, GameState state, int questionNumber) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;

    if (state is Loaded) {
      List<Widget> answersWidgets =
          List<Widget>.generate(numberOfAnswers[questionNumber], (index) {
        return MaterialButton(
          onPressed: ((){
            onPressed(index);

          }),
          child: Container(
            width: dev_width / 5,
            height: dev_height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        );
      });

      return answersWidgets;
    } else {
      return <Card>[];
    }
  }
}
