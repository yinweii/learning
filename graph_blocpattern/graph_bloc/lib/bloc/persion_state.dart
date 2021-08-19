part of 'persion_bloc.dart';

abstract class PersionState extends Equatable {
  const PersionState();

  @override
  List<Object> get props => [];
}

class LoadingState extends PersionState {}

class LoadedSuccessState extends PersionState {
  final dynamic data;

  LoadedSuccessState({@required this.data});
  @override
  // TODO: implement props
  List<Object> get props => data;
}

class LoadingFaildState extends PersionState {
  final String error;

  LoadingFaildState({@required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
