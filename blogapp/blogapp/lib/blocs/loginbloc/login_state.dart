part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

// waiting login
class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

//login success
class LoginSuccessState extends LoginState {
  final User user;

  LoginSuccessState({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];
}

//failed to login
class LoginFaildState extends LoginState {
  final String error;

  LoginFaildState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
