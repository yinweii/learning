part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

// Post loading
//Post loaded
// err
class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;

  PostLoadedState({this.posts});
  List<Object> get props => [posts];
}

class PostFaildState extends PostState {
  final String err;

  PostFaildState(this.err);
}
