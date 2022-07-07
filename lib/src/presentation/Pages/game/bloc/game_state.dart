import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/entities/question.dart';
part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {

  const factory GameState.init() = Initial;
  const factory GameState.loading() = Loading;
  const factory GameState.loaded(List<Question> questions) = Loaded;
  const factory GameState.saved() = Saved;
  const factory GameState.error(String message) = Error;
}