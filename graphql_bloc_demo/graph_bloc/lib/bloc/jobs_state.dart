part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsLoadingState extends JobsState {}

class JobsLoadedState extends JobsState {
  final List<Job> listJob;

  JobsLoadedState({this.listJob});
  @override
  List<Object> get props => [listJob];
}

class JobsFaildedState extends JobsState {
  final String error;

  JobsFaildedState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
