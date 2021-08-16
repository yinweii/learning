import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapp/repository/auth_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  AuthRepository authRepository;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartEvent) {
      try {
        var isSignIn = await authRepository.isSignIn();
        if (isSignIn) {
          var user = await authRepository.getCurrentUser();
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      } catch (e) {
        yield UnAuthenticatedState();
      }
    }
  }
}
