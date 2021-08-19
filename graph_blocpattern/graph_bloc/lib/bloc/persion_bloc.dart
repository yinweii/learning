import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:graph_bloc/graphservice/graphqlservice.dart';

part 'persion_event.dart';
part 'persion_state.dart';

class PersionBloc extends Bloc<PersionEvent, PersionState> {
  final _service = GraphQLService();
  PersionBloc() : super(LoadingState());

  @override
  Stream<PersionState> mapEventToState(
    PersionEvent event,
  ) async* {
    if (event is FetchEvent) {
      yield* _mapFetchDataEventToState(event);
    }
  }

  Stream<PersionState> _mapFetchDataEventToState(FetchDataEvent event) async* {
    final query = event.query;
    final variables = event.variables;
    try {
      final result = await _service.performQuery(query, variables: variables);

      if (result.hasException) {
        // print exception
        print('graphQLErrors: ${result.exception.graphqlErrors.toString()}');
        print('graphQLErrors: ${result.exception.linkException.toString()}');
        yield LoadingFaildState(
            error: result.exception.graphqlErrors[0].toString());
      } else {
        print('Succsess');
        yield LoadedSuccessState(data: (result.data) as List<dynamic>);
        print(result.data);
      }
    } catch (e) {
      print('Error');
      yield LoadingFaildState(error: e.toString());
    }
  }
}
