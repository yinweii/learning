part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final List<CommentPost> listComment;

  SearchLoaded({this.listComment});
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchFailed extends SearchState {
  final String error;

  SearchFailed({this.error});
}
