import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizz_game/src/data/entities/user.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/presentation/Pages/signin/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignInCubit({required this.authRepository, required this.userRepository}) : super(const Loading());

  Future<void> registerUser(String email, String password, TriviaUser user) async {
    emit(const Loading());
    User? userFromFirebase = await authRepository.signIn(email: email, password: password);
    if(userFromFirebase != null) {
      emit(const Success());
    } else {
      emit(const SignInState.error('Register error'));
    }
  }
}