part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class LoadingPostState extends PostState {}

class RefeshPostState extends PostState {}

class LoadedPostState extends PostState {
  final List<Post> posts;
  LoadedPostState({this.posts});
}

class FailedToLoadPostState extends PostState {
  final String error;

  FailedToLoadPostState({this.error});
}
