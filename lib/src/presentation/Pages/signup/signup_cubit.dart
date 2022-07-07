import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizz_game/src/data/entities/user.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/presentation/Pages/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignUpCubit({required this.authRepository, required this.userRepository}) : super(const Loading());

  Future<void> registerUser(String email, String password, TriviaUser user) async {
    emit(const Loading());
    User? userFromFirebase = await authRepository.signUp(email: email, password: password);
    if(userFromFirebase != null) {
      await userRepository.createUser(user);
      emit(const Saved());
    } else {
      emit(const SignUpState.error('Register error'));
    }
  }
}