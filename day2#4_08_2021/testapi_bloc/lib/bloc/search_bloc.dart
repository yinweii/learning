import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapi_bloc/models/comment.dart';

import 'package:testapi_bloc/repo_service/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ApiService _service;
  SearchBloc() : super(SearchInitial()) {
    _service = ApiService();
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is Search) {
      yield SearchInitial();
      try {
        final listComment = await _service.searchData(event.query);
        yield SearchLoaded(listComment: listComment);
      } catch (e) {
        yield SearchFailed(error: e);
      }
    }
  }
}
