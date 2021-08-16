import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapp/repository/auth_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());
  AuthRepository repository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonEvent) {
      try {
        var user = await repository.userSignIn(event.email, event.password);
        yield LoginSuccessState(user: user);
      } catch (e) {
        yield LoginFaildState(error: e);
      }
    }
  }
}
