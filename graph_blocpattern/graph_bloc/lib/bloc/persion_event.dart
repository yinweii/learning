part of 'persion_bloc.dart';

abstract class PersionEvent extends Equatable {
  const PersionEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends PersionEvent {
  final String query;
  final Map<String, dynamic> variables;

  FetchDataEvent({this.query, this.variables});
  @override
  // TODO: implement props
  List<Object> get props => [query, variables];
}
