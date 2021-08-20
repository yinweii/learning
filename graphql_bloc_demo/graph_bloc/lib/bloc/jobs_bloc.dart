import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graph_bloc/graphqlconfig/repository.dart';

import 'package:graph_bloc/model/job.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc() : super(JobsLoadingState()) {
    _repository = Repositories();
  }
  Repositories _repository;

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    if (event is AppStartEvent) {
      yield JobsLoadingState();
      final jobs = await _repository.fetchAllJobs();
      yield JobsLoadedState(listJob: jobs);
    }
  }
}
