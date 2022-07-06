import 'package:freezed_annotation/freezed_annotation.dart';
part 'signupState.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.saved() = Saved;
  const factory SignUpState.error(String message) = Error;
}