import 'package:quizz_game/src/data/entities/question.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_game/src/data/repositories/question_repository.dart';

class GameCubit extends Cubit<GameState> {
  final QuestionRepository questionRepository;

  GameCubit( {required this.questionRepository}) : super(const Initial());

  Future<void> fetchWord() async {
    try {
      final List<Question>? list = await questionRepository.getQuestions();
      emit(Loaded(list!));
    } on Exception catch(exception) {
      emit(Error(exception.toString()));
    }
  }

}