import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapi_bloc/cubit/post_event.dart';
import 'package:testapi_bloc/models/post.dart';
import 'package:testapi_bloc/repo_service/api_service.dart';
part 'post_state.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = ApiService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getData());
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final _apiService = ApiService();
  PostBloc() : super(LoadingPostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadedPostEvent || event is RefeshPostEvent) {
      yield LoadingPostState();
      try {
        final posts = await _apiService.getData();
        yield LoadedPostState(posts: posts);
      } catch (e) {
        yield FailedToLoadPostState(error: e.toString());
      }
    }
  }
}
