part of 'regis_bloc.dart';

abstract class RegisState extends Equatable {
  const RegisState();

  @override
  List<Object> get props => [];
}

class RegisInitial extends RegisState {}

class RegisLoadingState extends RegisState {}

class RegisSuccsessState extends RegisState {
  final User user;

  RegisSuccsessState({this.user});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class RegisFaildState extends RegisState {
  final String error;

  RegisFaildState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
