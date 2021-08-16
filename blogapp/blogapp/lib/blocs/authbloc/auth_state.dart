part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

//
class AuthenticatedState extends AuthState {
  final User user;

  AuthenticatedState({this.user});
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UnAuthenticatedState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
