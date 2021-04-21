import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  //gerencia de estado com Value Notifier
  final stateNotifier = ValueNotifier<HomeState>(HomeState.vazio);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.carregando;
    user = await repository.getUser();
    state = HomeState.sucesso;
  }

  Future<void> getQuizzes() async {
    state = HomeState.carregando;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucesso;
  }
}
