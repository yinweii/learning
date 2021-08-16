part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPostEvent extends PostEvent {}

//add new post
class AddPostEvent extends PostEvent {
  final File image;
  final String title;

  AddPostEvent({this.image, this.title});
  @override
  // TODO: implement props
  List<Object> get props => [image, title];
}

//update all post
class UpdatePostEvent extends PostEvent {
  final List<Post> posts;

  UpdatePostEvent({this.posts});
  @override
  // TODO: implement props
  List<Object> get props => [posts];
}
