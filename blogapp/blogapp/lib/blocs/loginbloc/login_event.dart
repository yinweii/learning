part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonEvent({this.email, this.password});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
