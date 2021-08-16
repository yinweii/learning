part of 'signout_bloc.dart';

abstract class SignoutState extends Equatable {
  const SignoutState();

  @override
  List<Object> get props => [];
}

class SignoutInitialState extends SignoutState {}

class SignOutSuccessState extends SignoutState {}

class SignoutFaildState extends SignoutState {}
