import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapp/repository/auth_repositories.dart';
import 'package:equatable/equatable.dart';

part 'signout_event.dart';
part 'signout_state.dart';

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  SignoutBloc() : super(SignoutInitialState());
  AuthRepository repository;

  @override
  Stream<SignoutState> mapEventToState(
    SignoutEvent event,
  ) async* {
    if (event is LogOutPressEvent) {
      await repository.signOut();
      yield SignOutSuccessState();
    }
  }
}
