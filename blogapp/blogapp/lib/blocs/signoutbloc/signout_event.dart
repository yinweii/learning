part of 'signout_bloc.dart';

abstract class SignoutEvent extends Equatable {
  const SignoutEvent();

  @override
  List<Object> get props => [];
}

class LogOutPressEvent extends SignoutEvent {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
