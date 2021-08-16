part of 'regis_bloc.dart';

abstract class RegisEvent extends Equatable {
  const RegisEvent();

  @override
  List<Object> get props => [];
}

//onpress signup button event
class SignUpButtonEvent extends RegisEvent {
  final String email;
  final String password;

  SignUpButtonEvent({this.email, this.password});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
