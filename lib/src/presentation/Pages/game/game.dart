import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_game/src/data/entities/question.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_cubit.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_state.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';

import '../../../data/repositories/question_repository.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePagePageState createState() => _GamePagePageState();
}

class _GamePagePageState extends State<GamePage> {
  GameCubit? cubit;

  String? text;

  List<Question> questions = <Question>[];

  void onPressed() {
    print("dowered");
    setState(() {
      questions.removeAt(0);
      print(questions.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
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
                  questions = state.questions;
                });
              }
            },
            builder: (context, state) {
              return SizedBox(
                width: dev_width,
                height: double.infinity,
                child: Column(
                  children: [
                    AbsorbPointer(
                      child: Container(
                        width: dev_width,
                        color: Colors.white,
                        child: SwipingCardDeck(
                          onDeckEmpty: () => debugPrint("Card deck empty"),
                          onLeftSwipe: (Card card) =>
                              debugPrint("Swiped left!"),
                          onRightSwipe: (Card card) =>
                              debugPrint("Swiped right!"),
                          swipeThreshold: MediaQuery.of(context).size.width / 4,
                          minimumVelocity: 1000,
                          cardWidth: 200,
                          rotationFactor: 0.8 / 3.14,
                          swipeAnimationDuration:
                              const Duration(milliseconds: 500),
                          cardDeck: createCards(context, state),
                        ),
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

  List<Card> createCards(BuildContext context, GameState state) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;

    if (state is Loaded) {
      final cards = List<Card>.generate(questions.length, (int index) {
        return Card(
          color: Colors.blueAccent,
          child: SizedBox(
            width: 0.9 * dev_width,
            height: 3 * dev_height / 4,
            child: Column(
              children: [
                SizedBox(
                  child: Center(
                      child: Text(
                    questions[index].question ?? "No Question Fuck OFF",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(
                  child: Column(children: [
                    Column(
                      children: generateAnswers(context, state, index),
                    ),
                    Column(
                      children: generateAnswerButtons(context, state, index),
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
      return <Card>[];
    }
  }

  List<Widget> generateAnswers(
      BuildContext context, GameState state, int questionnumber) {
    if (state is Loaded) {
      var answers = questions[questionnumber].incorrectAnswers;
      answers!.add(questions[questionnumber].correctAnswer);

      List<Widget> answersWidgets =
          List<Widget>.generate(answers.length, (index) {
        return Text(
          (index + 1).toString() + ": " + answers[index],
          style: const TextStyle(color: Colors.white),
        );
      });

      return answersWidgets;
    } else {
      return <Card>[];
    }
  }

  List<Widget> generateAnswerButtons(
      BuildContext context, GameState state, int questionnumber) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;

    if (state is Loaded) {
      var answers = questions[questionnumber].incorrectAnswers;

      List<Widget> answersWidgets =
          List<Widget>.generate(answers!.length, (index) {
        return IgnorePointer(
          child: MaterialButton(
            onPressed: onPressed,
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
          ),
        );
      });

      return answersWidgets;
    } else {
      return <Card>[];
    }
  }
}
