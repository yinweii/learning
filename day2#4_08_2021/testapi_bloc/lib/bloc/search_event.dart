part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class Search extends SearchEvent {
  final String query;

  Search({this.query});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
