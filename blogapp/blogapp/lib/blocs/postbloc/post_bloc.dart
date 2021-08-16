import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blogapp/model/post.dart';
import 'package:blogapp/repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Reponsitory _reponsitory;
  StreamSubscription _subscription;
  PostBloc(this._reponsitory) : super(PostLoadingState());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoadPostEvent) {
      yield PostLoadingState();
      _subscription?.cancel();
      try {
        _subscription = _reponsitory
            .getPost()
            .listen((posts) => add(UpdatePostEvent(posts: posts)));
        // List<Post> posts = await _reponsitory.getPost().first;
        // yield PostLoadedState(posts: posts);
      } catch (e) {
        yield PostFaildState(e);
      }
    } else if (event is AddPostEvent) {
      yield* _mapAddPostToState(event);
    } else if (event is UpdatePostEvent) {
      yield* _mapUpdatePostToState(event);
    }
  }

//map addpostEvent to state
  Stream<PostState> _mapAddPostToState(AddPostEvent event) async* {
    await _reponsitory.pushPost(event.image, event.title);
  }

  //map updatepostEvent to state
  Stream<PostState> _mapUpdatePostToState(UpdatePostEvent event) async* {
    yield PostLoadedState(posts: event.posts);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _subscription?.cancel();
    return super.close();
  }
}
