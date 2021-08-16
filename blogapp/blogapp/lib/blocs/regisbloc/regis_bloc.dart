import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapp/repository/auth_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'regis_event.dart';
part 'regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  RegisBloc() : super(RegisInitial());
  AuthRepository repository;

  @override
  Stream<RegisState> mapEventToState(
    RegisEvent event,
  ) async* {
    if (event is SignUpButtonEvent) {
      yield RegisLoadingState();
      try {
        var user = await repository.createUser(event.email, event.password);
        yield RegisSuccsessState(user: user);
      } catch (e) {
        yield RegisFaildState(error: e);
      }
    }
  }
}
